Facter.add("localinterface") do
        confine :kernel => :linux
                setcode do
                        if Facter.interfaces.include? "em1"
                                interface = "em1"
                        else
                                interface = "eth0"
                        end
                end
end
