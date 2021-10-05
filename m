Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF58C433EF
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 05:40:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DC41E61507; Tue,  5 Oct 2021 05:40:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A60A6124F;
	Tue,  5 Oct 2021 05:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633412452;
	bh=w5ucb4+0Z/Zj+8BnKuW+MTsTn0BjzDzqBW39H/ChTqA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=iRNrQdxr7tHjn+h9xtVu7o4j9nAsIqmagzTGU/kESiPKuUzrymvzttyL4u2ZrnGu3
	 IEiF846SjAt7jO7Zl4sfWp97hfn6J45HF3om1o3tZj+/uSVg08V3rrqb8V2j7t4Cs+
	 VL2qUIIRwjm92d2zJMwDkDcFV/DygcUBYeSHTzOzkmbxUE+pWVYW+4ijM4qDSZeGuR
	 rQyid+YuIFSXyB+E3rdcvqN9vxgrOYnC8ZeKAcjP6iEsLM3jlcdEu6PBdPQZ93BmcP
	 dM8ygvFM+pFbIXqzrmKEtT3YYTIsYEgB6Q6bpbEsP2G/0cGE/3Y85V3vEgj7Mf2aCF
	 DRKzCOl17j7dA==
Date: Tue, 5 Oct 2021 13:40:46 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, krzk@kernel.org, leoyang.li@nxp.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ARM: dts: add E70K02 based eBook readers
Message-ID: <20211005054037.GL20743@dragon>
References: <20210924085832.2560317-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924085832.2560317-1-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Sep 24, 2021 at 10:58:28AM +0200, Andreas Kemnade wrote:
> Add devicetrees for E70K02 based ebook readers. 
> Name on mainboard is: 37NB-E70K0M+6A3
> Serials start with: E70K02 (a number also seen in vendor kernel
> sources).
> 
> These boards are found in the Kobo Libra H2O with an i.MX6SLL and
> in the Tolino Vision 5 with an i.MX6SL.
> 
> Work is based on code from the vendor kernel at
> https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-librah2o/kernel.tar.bz2
> but things need to be heavily reworked due to
> incompatible bindings.
> 
> Changes in v2:
> 
> Node names style cleanup, mainly mmc stuff, s/_/-/
> 
> Andreas Kemnade (4):
>   dt-bindings: arm: fsl: Add E70K02 based ebook readers
>   ARM: dts: add Netronix E70K02 board common file
>   ARM: dts: imx: add devicetree for Kobo Libra H2O
>   ARM: dts: imx: add devicetree for Tolino Vision 5

Applied all, thanks!
