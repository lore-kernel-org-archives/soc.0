Return-Path: <SRS0=+ipK=R5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1CCC433EF
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49C6AC36AED; Thu, 13 Jan 2022 12:40:40 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D238C36AE9
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D238C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0D3753F1E0
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642077638;
	bh=NtF9Qcv8dCyv4imQqdPZ0gphBbiJgf6BkMwibu0qdek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=L9XSYT2EtpUagpr2p2HuraY0FOZZAlYM3LdHXBYCAxjIivc/jUhdsCG3xfPUHeME9
	 jRFPoXCqB+N5Rwr1j873Wb4VDkXlPCyn+zuonpeF+GMCuIvMt6RlKVu+PzlDhrfkmN
	 RsprcpUp4siZR5ePbuVSKqDs2FMWDZtBoaTaMupUdwQ0CbZRFZF14tvssf4lXlbQ12
	 qO4IaUako93yX/cT59iyNCehK0WTyH4PnpWAJrexQ0Vf9mpv9hYb58yhudi1cBnASs
	 32czrIK+o9FtUaDL7322U2vSLFvhdjV8ft1KkCKjFCOHrjT/BUM8/tPvj1LKGv1bWT
	 EVAALO17p788A==
Received: by mail-ed1-f71.google.com with SMTP id x19-20020a05640226d300b003f8b80f5729so5184192edd.13
        for <soc@kernel.org>; Thu, 13 Jan 2022 04:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NtF9Qcv8dCyv4imQqdPZ0gphBbiJgf6BkMwibu0qdek=;
        b=T/5LFM09QG4BdmeIdrsa0eAkybbb0pcDvaygVYbYN6dkWh4kkRlSSjHJYH9apfJ5lv
         Uz31o+Vqu6BxIjLrCirC7c5QYXlxLkpMZbfpCrPwlEzJYryvX57AmoAXou8g/9cncNr1
         FV8zCGoDBHr9zrhg2Twx7jjC+6n0arvugSD8d+RXYxCFreX8twmvQUq0Qht92YbwC1Rc
         yi8oEuDn+uHlQiZEvOb+GW+A5UI+IQqZbwVbRLR1UUd5uuIu7ijrPByMXxasNDZlJqfp
         Y5BNS/QWkIqw0GDhEIyfXMtn37+o77nwQYQmmhzdDtkvtQSPbOSG2yQZ+kz7Sfmtyxkw
         Nctg==
X-Gm-Message-State: AOAM531+vAVmwWJZM9o2annOBCQiL82X6F8Zh6cat8Eefk6P55vxQbRW
	NLGYZc/f5aJTSLhldLbR1Ftng1MwTLCkDN7/Z6sUSoNei4bGcj/QO88xsCux1IleYQr7OzLqsQm
	/HtbAr4OO03tjvjdxz02Kg4w=
X-Received: by 2002:a05:6402:655:: with SMTP id u21mr4010439edx.30.1642077637731;
        Thu, 13 Jan 2022 04:40:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzysO4hAvoMYoJ/ruIH66z8VzH4bfZ21Ozb1u+/RRfHvZ0YP4DJm75J85RG/HrmE+6HlqV7UQ==
X-Received: by 2002:a05:6402:655:: with SMTP id u21mr4010406edx.30.1642077637409;
        Thu, 13 Jan 2022 04:40:37 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id sa13sm858440ejc.28.2022.01.13.04.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:40:37 -0800 (PST)
Message-ID: <c87f500e-e43e-465c-94fa-050c2b0de083@canonical.com>
Date: Thu, 13 Jan 2022 13:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 01/23] dt-bindings: clock: Document FSD CMU bindings
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122311epcas5p4b7c253b49dce3bd3580407fcf312e70e@epcas5p4.samsung.com>
 <20220113121143.22280-2-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 13:11, Alim Akhtar wrote:
> Add dt-schema documentation for Tesla FSD SoC clock controller.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../bindings/clock/tesla,fsd-clock.yaml       | 212 ++++++++++++++++++
>  1 file changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> new file mode 100644
> index 000000000000..58f341e5004d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/tesla,fsd-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tesla FSD (Full Self-Driving) SoC clock controller
> +
> +maintainers:
> +  - Alim Akhtar <alim.akhtar@samsung.com>
> +  - linux-fsd@tesla.com
> +
> +description: |
> +  FSD clock controller consist of several clock management unit
> +  (CMU), which generates clocks for various inteernal SoC blocks.
> +  The root clock comes from external OSC clock (24 MHz).
> +
> +  All available clocks are defined as preprocessor macros in
> +  'dt-bindings/clock/fsd-clk.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - tesla,fsd-clock-cmu
> +      - tesla,fsd-clock-imem
> +      - tesla,fsd-clock-peric
> +      - tesla,fsd-clock-fsys0
> +      - tesla,fsd-clock-fsys1
> +      - tesla,fsd-clock-mfc
> +      - tesla,fsd-clock-cam_csi
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 6
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: tesla,fsd-clock-cmu
> +

Nitpick: Drop the white-spaces between if-then. It's easier to spot the
if-blocks if they are together.

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (24 MHz)
> +

Drop this whitespace as well.

Rest looks good to me, except the discussion about the compatible.


Best regards,
Krzysztof
