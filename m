Return-Path: <SRS0=mfTL=QM=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD4AC0219D
	for <soc@archiver.kernel.org>; Sat, 14 Sep 2024 14:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 920BAC4CED1; Sat, 14 Sep 2024 14:19:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21D77C4CEC0;
	Sat, 14 Sep 2024 14:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21D77C4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726323552; x=1757859552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9wMgdRefGu42K7ypeuSJnPQEd7Ns/OJA/BRmLa/8qc=;
  b=USgBtCjVcxufnJh9KVshcT6/3aSddwTsIRIxa+Ulnels+esyy0gAXEV5
   PNr3wAGmQi8cgru5XhKuinNueGZcFwEpm0rFBztt5uzCOm77k2vLGLJU8
   2Z0nq27B7TjEI7DJoTe7/EdyIwRLmoUR1k52Aw1Pn1DFwN9oPTKN+mZ89
   5/lXiJhlrhm+GJzMLX1Mhlf9P2/34yeY6EVYNhPS5vqmsBlvYHMF7bI2d
   B5TUdbze0dKXJUHn/R8R474SKgwNYd1eqwdvgifl5IWm2sUDwklZOlq42
   WYUJr/ZbWJm4IEPZKh9j9LYBAqTaXcSxhb7V6s8fKHnYXNlTpGjUTA82N
   w==;
X-CSE-ConnectionGUID: MGj6LDNYTEa0ueo+8eGmLg==
X-CSE-MsgGUID: M+SfikP9SZeWPAWYB0SJ2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25090389"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25090389"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 07:19:11 -0700
X-CSE-ConnectionGUID: bLVvHNP4RYS89Cob7sBRYA==
X-CSE-MsgGUID: 1WBix8DISMO95aCgNnVb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="99080744"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 07:19:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spTc5-0007pg-0v;
	Sat, 14 Sep 2024 14:19:01 +0000
Date: Sat, 14 Sep 2024 22:18:45 +0800
From: kernel test robot <lkp@intel.com>
List-Id: <soc.lore.kernel.org>
To: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Malysa <greg.malysa@timesys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 07/21] clock: Add driver for ADI ADSP-SC5xx clock
Message-ID: <202409142102.LvuMEIro-lkp@intel.com>
References: <20240912-test-v1-7-458fa57c8ccf@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-7-458fa57c8ccf@analog.com>

Hi Arturs,

kernel test robot noticed the following build warnings:

[auto build test WARNING on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Arturs-Artamonovs-via-B4-Relay/arm64-Add-ADI-ADSP-SC598-SoC/20240913-022308
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240912-test-v1-7-458fa57c8ccf%40analog.com
patch subject: [PATCH 07/21] clock: Add driver for ADI ADSP-SC5xx clock
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142102.LvuMEIro-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/clk/adi/clk-adi-sc598.c: linux/clk.h is included more than once.

vim +9 drivers/clk/adi/clk-adi-sc598.c

   > 9	#include <linux/clk.h>
    10	#include <linux/clk-provider.h>
  > 11	#include <linux/clk.h>
    12	#include <linux/err.h>
    13	#include <linux/module.h>
    14	#include <linux/of_address.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
