Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCAAC433EF
	for <soc@archiver.kernel.org>; Fri, 28 Jan 2022 11:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FA20C340E6; Fri, 28 Jan 2022 11:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6942FC340E0;
	Fri, 28 Jan 2022 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643371187;
	bh=0SuZMuWMlwedu/ZdtokQMa6BrZFs0dA1g1UTHUdkOSc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kFbz+ePCShpPJ/mS9rl5iIk3iergKowlhUtoW3esZ1u+Jyr9RZTOiDfLNcIv6sg8h
	 PTZGs/ODFnepTpIlNgFtUz0K9kNITfK/hMLXd7aQxQneqa9JJF68m9Zxv4JY+mGsSW
	 K9/y4ZMTKGZQe9tKxCERoB3Pp7kJlGant2oBNzP7TfZuJZNq9Ggv/sNVE+ra1eAjB9
	 Z8lZgz7uNuzOsLPOh890H89fdSRpciNJWdm5+Hhv6YMZrlXkIgQnS+IVnvQ3OEmWtq
	 pQ1f9KSE9OdfqiQwLo85J8Tq8i3dmJZDDHJmYvpwXuLQHLRFPHCTcuyI3y98E4HCCF
	 il8fxyvdK7xwQ==
Date: Fri, 28 Jan 2022 19:59:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
	stefan@agner.ch, linus.walleij@linaro.org,
	gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
	adrian.hunter@intel.com, jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v8 7/7] ARM: imxrt_defconfig: Add i.MXRT family defconfig
Message-ID: <20220128115938.GL4686@dragon>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-8-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111215415.2075257-8-Mr.Bossman075@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 11, 2022 at 04:54:15PM -0500, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Add generic i.MXRT family defconfig.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Applied, thanks!
