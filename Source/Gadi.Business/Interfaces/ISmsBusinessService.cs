﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gadi.Business.Interfaces
{
    public interface ISmsBusinessService
    {
        bool SendSMS(string to, string message);
    }
}
