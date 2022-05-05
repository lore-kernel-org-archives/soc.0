Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1FFC433F5
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 10:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 439B5C385B0; Thu,  5 May 2022 10:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55E4C385A4;
	Thu,  5 May 2022 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651746247;
	bh=iMnFOvuiwTjFijPEiQIXgpR5R/Gn1+LnYBhpSFjp7vo=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=DiuERzlFnii1dhi1COBrLJijblb72Oi2YTw9szrv3SVYnLXWP6GTrIMPrcQipPFbg
	 U4Cilb4I/3xpQL5LH7cFpxrA1HaYheV2yL6BsBan3DF4D2rmrCXSlceUuPZ+yW6EXG
	 bdmfc1ro9RYHMOLiGpfmoGueXwP2tBxjbMXUVlpuYpYDI6xb25IAtoptezWiwKtDOs
	 jX1k3na12fD5FCfcgzeckUYdlHB10YG8Xpm9gy7Ra9Lgjx3NzeKgg/sO8XTX1GLp5r
	 gzrUt7jlM86Lefqxj9bcIQ6+dKLAcbdkNmrq/7j89/709I6ilMIAipG08IqXzhH0Da
	 LvHN1NmseufIg==
Message-ID: <468d4bbd-f6f7-f000-1a46-f5399d19a03f@kernel.org>
Date: Thu, 5 May 2022 12:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 4/4] ARM: dts: Add bosch acc board
Content-Language: en-US
To: Philip Oberfichtner <pro@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, matthias.winker@de.bosch.com
References: <20220505095725.902447-1-pro@denx.de>
 <20220505095725.902447-4-pro@denx.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220505095725.902447-4-pro@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/05/2022 11:57, Philip Oberfichtner wrote:
> Add device tree for the Bosch ACC board, based on i.MX6 Dual.
> 
> Signed-off-by: Philip Oberfichtner <pro@denx.de>

> +
> +	reg_5P0: regulator-5P0 {

lowercase letters only in node names and labels.


Best regards,
Krzysztof
