Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0D3C433F5
	for <soc@archiver.kernel.org>; Sat, 23 Apr 2022 02:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0E21C385AB; Sat, 23 Apr 2022 02:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E931C385A4;
	Sat, 23 Apr 2022 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650680014;
	bh=Epma3yKBMOxjFrsFxTUT9AvMzDxrBTfVtmIRQSfWV78=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=XGTM3H3uYNKvF18vUA4+y54w6J6mWhg1K8hJQPNRLV9JT3xytclxUqB9NbiVnYbNU
	 COdxkI3NrhJduV7wsTH+x51c4Y0UMYuR1hFLonTun/gl5xaKGKTxtc58CNpJt+w9I6
	 8OCl5xsprn7Oc34+XAE/GIZMNtsHhzwVKDbh8mQMgPxcOhS5ItLog/Rgbfe3Lcic1z
	 iDVmolmINtW0IgbHUW1pybWfjal5Bq6RN9nMjbbOzfEbeYb+Ku76NH9IEkEg4DEnVR
	 CfozBlehLaKvg1op0K7StCgTOGxbwfCYXrZS138iHoy2jxQJVK8Wx52mFfkDTSB3D7
	 1NokYMxjozbhQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220314084409.84394-2-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name> <20220314084409.84394-2-nbd@nbd.name>
Subject: Re: [PATCH v10 1/6] dt-bindings: Add en7523-scu device tree binding documentation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, soc@kernel.org
Date: Fri, 22 Apr 2022 19:13:31 -0700
User-Agent: alot/0.10
Message-Id: <20220423021334.9E931C385A4@smtp.kernel.org>

Quoting Felix Fietkau (2022-03-14 01:44:03)
> From: John Crispin <john@phrozen.org>
>=20
> Adds device tree binding documentation for clocks in the EN7523 SOC.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

I removed the duplicate SoB
