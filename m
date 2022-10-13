Return-Path: <SRS0=S3Qq=2O=linux.intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CADDC4332F
	for <soc@archiver.kernel.org>; Thu, 13 Oct 2022 16:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC801C43470; Thu, 13 Oct 2022 16:09:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76A96C433D6;
	Thu, 13 Oct 2022 16:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76A96C433D6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665677363; x=1697213363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPQmeZ5uzAfg/Yu3vsd+t3FuvAOQsHliIP9WOqPYQKw=;
  b=d+1BpUfrFNX96tIwBQAhR5X938mWwzH03Up7K1nKmpA6FCrxXx4RGh9u
   xfkmyie4gAZ9Uf0Iwt84GWUy2LDCdYtgN0X0n1DoLR8k+Z15bYBU2ZxG3
   6CfqmQ8k98mflfiDwnoh64dh1hPtDljlERspA0bjX5kTOOR/eC6pp+j6Z
   Mp6no+EATh5rv4aV3kaqN0K5Qpx6dcnm+xhjcvD/Dp8vEBgMRcWeYrO6M
   PV9MKP8WmtXpcfrhEWqc+oBBlSc3lt6d1Av+kkpTXNNNo9xktmwW4wC5i
   zDlf/zTl7Z31FydiC+y7GyllPBrRg4+bxg52JdfT4ZWoUrZ9xE7LIt1IS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="331630044"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="331630044"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 09:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="802296581"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="802296581"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2022 09:05:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oj0hv-006V2r-0F;
	Thu, 13 Oct 2022 19:05:15 +0300
Date: Thu, 13 Oct 2022 19:05:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Rafa?? Mi??ecki <rafal@milecki.pl>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andreas F??rber <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>, Paul Cercueil <paul@crapouillou.net>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2 35/36] pinctrl: intel: Add missed header(s)
Message-ID: <Y0g3OiL/9oQlcovJ@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-36-andriy.shevchenko@linux.intel.com>
 <Y0gma4fmhWISrKHe@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0gma4fmhWISrKHe@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 13, 2022 at 05:53:31PM +0300, Mika Westerberg wrote:
> On Mon, Oct 10, 2022 at 11:14:51PM +0300, Andy Shevchenko wrote:
> > Do not imply that some of the generic headers may be always included.
> > Instead, include explicitly what we are direct user of.
> > 
> > While at it, sort headers alphabetically.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> For all the intel pinctrl changes.

Thank you, I have added it to the 4 Intel related patches.

-- 
With Best Regards,
Andy Shevchenko


