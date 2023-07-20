Return-Path: <SRS0=8xwM=DG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC55EB64DA
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 12:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62080C433CB; Thu, 20 Jul 2023 12:36:44 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C6CAC433C8
	for <soc@kernel.org>; Thu, 20 Jul 2023 12:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C6CAC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-992af8b3b1bso135774266b.1
        for <soc@kernel.org>; Thu, 20 Jul 2023 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689856601; x=1690461401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TeWGw2gUiLPO/RS6979ifpmA5NC37xcO8V3RqV0p6sM=;
        b=UEICAlJLJDp+3I3EqRBjOrINwFRMYbI9+BKYwQcOQA7bCQVNhmAeCQR8nzfGdmgVkb
         Hx49390V+EBXAlE4CO0Tx0WpBbjHvqYICtv5F4KHyDxjwWgVHamv2WYNI+vzMmSC66gj
         Q0DjCb/yuDugLZunCw2fnqGwi+FCEQTYKQZt/561zhfw04rMEElFCJabPBLk4paFKakQ
         FHFcvWU8zENYfxWw1NcHl9FE8yaxLJBX6k88CifCRFoLYCDm/HzghVB9OsWg6DTkOA6x
         YmLvjmCI68JoaV1JDlHPh0YRCN+6oQbOU49Cj00sCaaY8DZwx8DB82CK0C03uU6k8op3
         QzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689856601; x=1690461401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeWGw2gUiLPO/RS6979ifpmA5NC37xcO8V3RqV0p6sM=;
        b=AUhkUs7jUbikzxxguIuyC/HIazFmH0HyBhKf544djOi03Awpfv4nRv8KdFAYUHLR6Q
         /PqRzgFF1aIw2vYfAreLU4qOTP6ipovvELU7Hj8vg02u66U7qsqdrrFE4uabY9A4iYGa
         wZ0mrCKeQ0HXLl6eEtBYyF71DrYWgPFndM23KCKw39lswkB6Y33KapJp8R4NQglfMcHI
         6e0Zqkm3Jaw/qFITfnUFA8A2V7qQfUkBbxgbhouiomBMtaEZzVbJVsOj8GVCe413P+Bp
         62djA8TDTz5i6FoIabCjS0+rU/q2aYQgJjg5gQuuRpzdaqHi4Ub3tZlX4EKNe2iqDiv0
         Wurw==
X-Gm-Message-State: ABy/qLYQDC2TTkzN5jIN2PFCqnb7gEzSajOSkHscomRHzHfjvzCzKDCN
	g5zo82TOPY29vlLxkOSyk0Hyuw==
X-Google-Smtp-Source: APBJJlFyWuz4RP3lpWwhWBFPBxHH+evG1aHzuSnSD11+X1U38hrobyh2hgqG/WfGnjR28zjpg4Omaw==
X-Received: by 2002:a17:906:7a07:b0:99b:4668:865f with SMTP id d7-20020a1709067a0700b0099b4668865fmr3407023ejo.10.1689856601393;
        Thu, 20 Jul 2023 05:36:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906164a00b00977cad140a8sm636723ejd.218.2023.07.20.05.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 05:36:40 -0700 (PDT)
Message-ID: <f67d710c-bacc-8480-a918-db84b82885e1@linaro.org>
Date: Thu, 20 Jul 2023 14:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board
 support
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stefan Wahren <stefan.wahren@chargebyte.com>,
 Andreas Kemnade <andreas@kemnade.info>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?=
 <michal.vokac@ysoft.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jesse Taube <mr.bossman075@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230719224141.3716815-1-james.hilliard1@gmail.com>
 <20230719224141.3716815-2-james.hilliard1@gmail.com>
 <0ad5a223-d70f-deaa-6261-a2bd2b2af40d@linaro.org>
 <CADvTj4qvXvuV=ASg5h4hPr8QG-NR48j6G36AZC5xHDdhLyjT7w@mail.gmail.com>
 <c70e397e-dee8-2155-9f0b-538e95bda2eb@linaro.org>
 <CADvTj4p72nh5umeSRw2OhjA5NyyZY_BkMhzJBn4Y2AHZHA3+dw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADvTj4p72nh5umeSRw2OhjA5NyyZY_BkMhzJBn4Y2AHZHA3+dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2023 14:22, James Hilliard wrote:
>> Take a look at IMX8 Variscite SoMs.
> 
> Oh, I see what you mean now, so it looks like this is missing for the dart-mx6
> device tree.
> 
> imx8mm-var-som.dtsi:    compatible = "variscite,var-som-mx8mm", "fsl,imx8mm";
> imx8mm-var-som-symphony.dts:    compatible =
> "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm",
> "fsl,imx8mm";
> 
> imx6q-var-dt6customboard.dts:    compatible =
> "variscite,dt6customboard", "fsl,imx6q";
> 
> So the DART-MX6 is missing a compatible along the lines of
> "variscite,dart-imx6q"
> for the dart SoM I guess?

It's different topic whether it is worth to fix DART-MX6. In general it
misses its compatible, but it might be not worth to fix.

> 
> And for VAR-SOM-MX6 I guess I should use something like
> "variscite,var-som-imx6q"
> for the SoM right?

Yes.

Best regards,
Krzysztof

