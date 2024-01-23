Return-Path: <SRS0=mRFD=JB=redhat.com=lbiancon@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEC0C47258
	for <soc@archiver.kernel.org>; Tue, 23 Jan 2024 16:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBAB0C43399; Tue, 23 Jan 2024 16:35:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B3D9C433C7
	for <soc@kernel.org>; Tue, 23 Jan 2024 16:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B3D9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706027748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBZ0jM2Y91GDpqAFQdvBt0eQmR6O4Kseecz7ZIi6fjc=;
	b=gWilHyFWyjJezRHd+zYwNktDGWyMVNxugR2HaT66Ttt8Z7ZI7+YhG+7tKtqDXDgVwqC7XC
	/7WDdV53U5MTRboO4UngCLW5O6MoMaz4NAOQTFKbPeiNz/7nBZHxfYlykK3YaIxMD3eKgY
	Z8OSqBACT7cEdb43KzLKSoOorJGJ8Us=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-fkRsLV-sOj2hUq2AltcrlQ-1; Tue, 23 Jan 2024 11:35:47 -0500
X-MC-Unique: fkRsLV-sOj2hUq2AltcrlQ-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6e0fa06aba5so459486a34.2
        for <soc@kernel.org>; Tue, 23 Jan 2024 08:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706027746; x=1706632546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBZ0jM2Y91GDpqAFQdvBt0eQmR6O4Kseecz7ZIi6fjc=;
        b=BN99VdQiBIxGmUtzBrS03F74BrVGqDcW+/xpKxmYhqj870GgvwbKmFHTYUkaD845eY
         42dDPZ/wryfi1b0rT/NFxBouYJ6Y5tLuyeQJ7ykQ6/8hqnbjoBEFRkkH7d4ZNaK+LWcr
         yQdUpA/tjrd0HmAcOppVK3RMX3yfFwuf6OIKWXC/x15CQHyPB/7GmPjjGD33A7jZTyKk
         XGov1Iu4ivCehWwpogQmezNyR6aaZBVOElM+ERx00ZEwlv8aD0CqrsmlUUhDhETZWRHM
         Z6cC1NCLu25qDiT1vPGYRVWJyHZJg46S76snI28HFfvTlpCC3/I8EwDmF3RJAZemQs41
         1rfw==
X-Gm-Message-State: AOJu0Yw/2UNFqTSWQxC7AOtC/urJVeXI39W8BT2uYfMb13M4CflGw5AK
	bTmGxMcm9CIN69wzNLBgoW/qDlT5M/By/1Y0x1AHzk/ivDmN9NSejmgNsV1DJ9gdxfuxG45xmJx
	ZzW08JvbB5c3Mu/7ezeMm/tgSrs8CssUrSp56V7xtJPrGp8c9dYnTdc4wEBOwwKEiUiHquJq6pW
	6dmISGT2PNNzXrKCsFYw==
X-Received: by 2002:a05:6830:153:b0:6dd:e799:1d27 with SMTP id j19-20020a056830015300b006dde7991d27mr179166otp.26.1706027746560;
        Tue, 23 Jan 2024 08:35:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEsgoFIkZOcx3W2FCMnR8lFPMvJo4YZKlxyiSRsZwq65pcNCn8cxtzHSu7Td76xMksWYF5I/eNqb2OAWYrbt4=
X-Received: by 2002:a05:6830:153:b0:6dd:e799:1d27 with SMTP id
 j19-20020a056830015300b006dde7991d27mr179155otp.26.1706027746340; Tue, 23 Jan
 2024 08:35:46 -0800 (PST)
MIME-Version: 1.0
References: <95e2d79c1c36663cfffce5a20c95f8201670bbec.1704468417.git.lorenzo@kernel.org>
In-Reply-To: <95e2d79c1c36663cfffce5a20c95f8201670bbec.1704468417.git.lorenzo@kernel.org>
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Date: Tue, 23 Jan 2024 17:35:35 +0100
Message-ID: <CAJ0CqmW2AoXa8XxKzXOtBd3VfnOUjRYwjhj0KXg4mgKKHZ1gQw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: airoha: fix pcie ranges properties
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, 
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

>
> Reduce and split pcie controller memory ranges for en7523 SoC
> in order to properly load a pcie card on the second port.
>
> Fixes: 08a4aeb2c23f ("ARM: dts: Add PCIe support for Airoha EN7523")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  arch/arm/boot/dts/airoha/en7523.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
> index b523a868c4ad..bb78d54e94f6 100644
> --- a/arch/arm/boot/dts/airoha/en7523.dtsi
> +++ b/arch/arm/boot/dts/airoha/en7523.dtsi
> @@ -159,7 +159,7 @@ pcie0: pcie@1fa91000 {
>                 clocks = <&scu EN7523_CLK_PCIE>;
>                 clock-names = "sys_ck0";
>                 bus-range = <0x00 0xff>;
> -               ranges = <0x82000000 0 0x20000000  0x20000000  0 0x8000000>;
> +               ranges = <0x82000000 0 0x20000000 0x20000000 0 0x2000000>;
>                 status = "disabled";
>
>                 #interrupt-cells = <1>;
> @@ -188,7 +188,7 @@ pcie1: pcie@1fa92000 {
>                 clocks = <&scu EN7523_CLK_PCIE>;
>                 clock-names = "sys_ck1";
>                 bus-range = <0x00 0xff>;
> -               ranges = <0x82000000 0 0x28000000  0x28000000  0 0x8000000>;
> +               ranges = <0x82000000 0 0x22000000 0x22000000 0 0x2000000>;
>                 status = "disabled";
>
>                 #interrupt-cells = <1>;
> --
> 2.43.0
>

Hi Matthias,

Since you applied the original patch from Felix, I am wondering if
this fix is expected to go through your tree or applied directly by
Arnd.

Regards,
Lorenzo

