Return-Path: <SRS0=mfTL=QM=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650E5FC6169
	for <soc@archiver.kernel.org>; Sat, 14 Sep 2024 06:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33C94C4CECD; Sat, 14 Sep 2024 06:14:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83A9FC4CEC0;
	Sat, 14 Sep 2024 06:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83A9FC4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726294490; x=1757830490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gtgG7++hfQoedYAbNm1ByFyRcSWJX3tPiW00y5S+y0Y=;
  b=jzzP+lmh7JaohowrSYB455AxsHvDUx9RLo6AIEloPe0S7xENjuazFSH8
   WZvHQqj89aVH/c1m4SSw5+hZ0MRuQWSQXiCAOr4RlB+6d3ovHn/kPNUh4
   NNxZH3eSMKUMkcEvezdCGylVeGooH7PTErlXbC+MpHh6za6j1UcYvyH8J
   iy08XTgYBGfz6lyPAsMmonxvujuzPM1nMebTy07NQSYphHzuJqZXD8Qw1
   S8iW271tg+k2ksOHLaGlpaVMp+F5z7vCc485PIgMFeigLVQhFp/CQcbVV
   eMZOPvhuW1yVfWBni3Q2H3qKsjWKx8L8X2Kpw3wuWNgrroawjm3DGtZ2s
   w==;
X-CSE-ConnectionGUID: iguxdZeGQ+agXV4Qxt8uow==
X-CSE-MsgGUID: a3nS9c0vT+en77ZDZaKjsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="50617942"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="50617942"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:14:48 -0700
X-CSE-ConnectionGUID: StiVNNFcTWao6Bdsc5Zz+A==
X-CSE-MsgGUID: RzdkT+mxTHGF7AoTFI1KIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="105765711"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2024 23:14:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spM3O-0007Ru-1C;
	Sat, 14 Sep 2024 06:14:42 +0000
Date: Sat, 14 Sep 2024 14:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH leds v3 02/11] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <202409141326.XsUVZj3l-lkp@intel.com>
References: <20240913123103.21226-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913123103.21226-3-kabel@kernel.org>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240913]
[also build test ERROR on v6.11-rc7]
[cannot apply to lee-leds/for-leds-next robh/for-next linus/master v6.11-rc7 v6.11-rc6 v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20240913-203320
base:   next-20240913
patch link:    https://lore.kernel.org/r/20240913123103.21226-3-kabel%40kernel.org
patch subject: [PATCH leds v3 02/11] leds: turris-omnia: Use command execution functions from the MCU driver
config: arc-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141326.XsUVZj3l-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141326.XsUVZj3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141326.XsUVZj3l-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/leds/leds-turris-omnia.o: in function `gamma_correction_show':
>> leds-turris-omnia.c:(.text+0x26): undefined reference to `omnia_cmd_write_read'
>> arc-elf-ld: leds-turris-omnia.c:(.text+0x26): undefined reference to `omnia_cmd_write_read'
   arc-elf-ld: drivers/leds/leds-turris-omnia.o: in function `brightness_show':
   leds-turris-omnia.c:(.text+0x98): undefined reference to `omnia_cmd_write_read'
   arc-elf-ld: leds-turris-omnia.c:(.text+0x98): undefined reference to `omnia_cmd_write_read'
   arc-elf-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_led_send_color_cmd':
   leds-turris-omnia.c:(.text+0xfc): undefined reference to `omnia_cmd_write_read'
   arc-elf-ld: drivers/leds/leds-turris-omnia.o:leds-turris-omnia.c:(.text+0xfc): more undefined references to `omnia_cmd_write_read' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
