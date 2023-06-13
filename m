Return-Path: <SRS0=CZEf=CB=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1144EC7EE2E
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 09:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C501CC4339B; Tue, 13 Jun 2023 09:37:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4305C433EF;
	Tue, 13 Jun 2023 09:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4305C433EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686649025; x=1718185025;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=sK4SMOaK62ydzdde+segKUntckMsJWrxYGQGbFSDWmo=;
  b=JeF7OKMwK/hIjwY9Qumc98mawOvsH3kJZhD2p4xG/5S6zAijegJQcJft
   I3zTGAk++Hyb3jKBXyoUr1j+9xpJS9vCJRWBIe4/a/RufxzcLYqg4Np1s
   liPxVIsJx1culWvWr82Q+XdMXpc4LvtPmua2Qupp7ukWvkMAm9G0VV3Da
   N77NnDgahSG/TkfO1JcqPcP1pNNNl5WlUiJAsa8NA/X8iIcmgdeOpDb2C
   poXMrDtr3x9yT4+bOwZf0cYmJ3kCCzfHZgjBzqiNYiJRg0by9sdGnpjFk
   mqpcOklzlHmeIhPRw7qds8BikBR9w1FGLgfqYifcAEELbj80Q2kJATsmJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337916463"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="337916463"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 02:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="824325090"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="824325090"
Received: from abujor-mobl.ger.corp.intel.com ([10.249.44.113])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 02:36:50 -0700
Date: Tue, 13 Jun 2023 12:36:48 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, 
    mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, tmaimon77@gmail.com, 
    catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, 
    linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, 
    linux-serial <linux-serial@vger.kernel.org>, arnd@arndb.de, soc@kernel.org, 
    schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH v14 1/1] tty: serial: Add Nuvoton ma35d1 serial driver
 support
In-Reply-To: <20230612025355.547871-2-ychuang570808@gmail.com>
Message-ID: <6af0e528-096-391-43db-c07659e46e9@linux.intel.com>
References: <20230612025355.547871-1-ychuang570808@gmail.com> <20230612025355.547871-2-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1313138601-1686648986=:2099"
Content-ID: <205652a6-becb-10ae-b038-af463b408a16@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1313138601-1686648986=:2099
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <006fe4-6e79-c630-fb6f-8b81dee31dff@linux.intel.com>

On Mon, 12 Jun 2023, Jacky Huang wrote:

> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> This adds UART and console driver for Nuvoton ma35d1 Soc.
> It supports full-duplex communication, FIFO control, and
> hardware flow control.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.
--8323329-1313138601-1686648986=:2099--
