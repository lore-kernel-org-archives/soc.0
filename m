Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19ECC433EF
	for <soc@archiver.kernel.org>; Mon, 25 Oct 2021 06:54:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4A78E60FD7; Mon, 25 Oct 2021 06:54:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A59BB60E0C;
	Mon, 25 Oct 2021 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635144883;
	bh=aMM8nxIsnq28/SQaQXsgdHLfh+uLt3aqCHFseCYI4Zg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=u9OAZcqtQOZTTuwy6Nh9JiM0xUnhh2YJys/eb1CgTxX4oFQH/2g7zw/8FnAblaWDy
	 dqc8oAOYTWTmPm4RUE2Cr7rx6vFPzv5qTAm+OCydHXs59MdI502JCfthKlKgmACEpO
	 EMlt0h1caUtJCEhooVuzPxrsyMLf+PqI6WlQUqZY=
Date: Mon, 25 Oct 2021 08:54:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org,
	aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org,
	arnd@arndb.de, olof@lixom.net, soc@kernel.org,
	linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com,
	jirislaby@kernel.org, giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
	b20788@freescale.com, fugang.duan@nxp.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Message-ID: <YXZUscHQt9YRbZG2@kroah.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-10-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-10-Mr.Bossman075@gmail.com>

On Sun, Oct 24, 2021 at 11:40:23AM -0400, Jesse Taube wrote:
> Add support for i.MXRT1050's uart.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
