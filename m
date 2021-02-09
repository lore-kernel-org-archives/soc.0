Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EE2C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D44D64E54
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D44D64E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=teRXXF6+pquELQkWpaIe8Yas+5/Zf+E94q2kDd6yBtw=; b=HZupb/yoCI02/o+LxmB5n6ZTi
	oYeej8BQWcjV90wBO6CK9PUbd797GHIS8cUPnTCgEuZhyBfmC/jOSwowWM4Kc4MehbJ72p8rMCQrn
	jxa7TpgORBFBUQo346F5PqSoqfu+aIoi7sQE1dMdamBE5SN4UiqnP8LmgQE34e23UShnegeOnvBoR
	ieca9dGHlOJFRWUx841RjWndqPHJsjLbmK9VtsQokUGAl4BYpCa8QG2wqmqp+9K+/dkxOc5m/VrF9
	jwWbBUA4aAdadG/i/jgATMoWfAToKzxC2Xlkq7OzYCUt8WWH/Es/wAy3mwfcmcAfV5LLvmeC4PxHQ
	f5Hrp3VrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c7W-00081M-5z; Tue, 09 Feb 2021 23:08:35 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c6b-0007bT-VG
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:07:42 +0000
Received: by mail-ot1-f52.google.com with SMTP id c16so122317otp.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Feb 2021 15:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=flen+Q6BhqZvu5yUFGM567078RbssUkrmoOHzn1oN0E=;
 b=XPX72X1ksO/26HjzCQA/ofmooqeRaAVhYTxeuWb6vIDV1nSg4Vs+ytKDBC0FY0HUYE
 iT5BFQgiA8qU4qf5EKS7Y9KRCdm5W/4CjUL43+cils/0gsCk89KUuUAawbLqe5TjJD27
 Ofhqss06jSm+J9fRjDL6jgNghizG27YL2i/0ai0gcUglcwzbcXOoKOPwUNvxaVE+I/pM
 WNCWCJSxyp/1uRPbw8FupIZhW5WwL2MF9xc69ZePdB8iKvjEgkK9iuuWEWPxycvQH8RV
 ikHTE81NKKXhTRqqAiY0bBhFbRlb4i3ipm0EjEC3hIUeaGJjXbQ7E873AIYV42ZUqPAT
 +VDg==
X-Gm-Message-State: AOAM530C+jzjP1jv0yBfBPvJgFJSSfqN3kVgdy4E9yCNXRGpOxFOxVnw
 51KUj4ZorkEWxW7u5iXuMQ==
X-Google-Smtp-Source: ABdhPJwxZgOwm8lVG9U+3qOA69ztcXYK2Xdl9Kak65G3myAMYyBpwcpvQOGW8ZWCWZU9eSatBKyzZg==
X-Received: by 2002:a9d:61d1:: with SMTP id h17mr6253otk.113.1612912056647;
 Tue, 09 Feb 2021 15:07:36 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g66sm2454otg.54.2021.02.09.15.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 15:07:35 -0800 (PST)
Received: (nullmailer pid 398853 invoked by uid 1000);
 Tue, 09 Feb 2021 23:07:34 -0000
Date: Tue, 9 Feb 2021 17:07:34 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 14/18] dt-bindings: interrupt-controller: Add DT bindings
 for apple-aic
Message-ID: <20210209230734.GA387609@robh.at.kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-15-marcan@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204203951.52105-15-marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180738_204945_A2293D0D 
X-CRM114-Status: GOOD (  23.18  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230734.YECva5hKRO5eebl2P2MCz5HN6DPDXYNaRR9IVkoRq1w@z>

On Fri, Feb 05, 2021 at 05:39:47AM +0900, Hector Martin wrote:
> AIC is the Apple Interrupt Controller found on Apple ARM SoCs, such as
> the M1.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  .../interrupt-controller/AAPL,aic.yaml        | 88 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  .../interrupt-controller/apple-aic.h          | 14 +++
>  3 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
>  create mode 100644 include/dt-bindings/interrupt-controller/apple-aic.h
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
> new file mode 100644
> index 000000000000..7e119614275a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/AAPL,aic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Interrupt Controller
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description: |
> +  The Apple Interrupt Controller is a simple interrupt controller present on
> +  Apple ARM SoC platforms, including various iPhone and iPad devices and the
> +  "Apple Silicon" M1 Macs.
> +
> +  It provides the following features:
> +
> +  - Level-triggered hardware IRQs wired to SoC blocks
> +    - Single mask bit per IRQ
> +    - Per-IRQ affinity setting
> +    - Automatic masking on event delivery (auto-ack)
> +    - Software triggering (ORed with hw line)
> +  - 2 per-CPU IPIs (meant as "self" and "other", but they are interchangeable
> +    if not symmetric)
> +  - Automatic prioritization (single event/ack register per CPU, lower IRQs =
> +    higher priority)
> +  - Automatic masking on ack
> +  - Default "this CPU" register view and explicit per-CPU views
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - AAPL,aic
> +        - AAPL,m1-aic

Instead of 'contains', this should be:

items:
  - const: AAPL,m1-aic
  - const: AAPL,aic

With 'apple' instead...

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 3
> +    description: |
> +      The 1st cell contains the interrupt type:
> +        - 0: Hardware IRQ
> +        - 1: FIQ
> +        - 2: IPI
> +
> +      The 2nd cell contains the interrupt number.
> +        - HW IRQs: interrupt number
> +        - FIQs:
> +          - 0: physical timer
> +          - 1: virtual timer
> +        - IPIs:
> +          - 0: normal/"other" IPI (used interanlly for virtual IPIs)
> +          - 1: self IPI (normally unused)
> +
> +      The 3rd cell contains the interrupt flags. This is normally
> +      IRQ_TYPE_LEVEL_HIGH (4).
> +
> +  reg:
> +    description: |
> +      Specifies base physical address and size of the AIC registers.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +  - reg
> +
> +unevaluatedProperties: false

additionalProperties: false

(stricter and actually has support implemented)

> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        aic: interrupt-controller@23b100000 {
> +            compatible = "AAPL,m1-aic", "AAPL,aic";
> +            #interrupt-cells = <3>;
> +            interrupt-controller;
> +            reg = <0x2 0x3b100000 0x0 0x8000>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91a7b33834ac..f3d4661731c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1634,6 +1634,8 @@ B:	https://github.com/AsahiLinux/linux/issues
>  C:	irc://chat.freenode.net/asahi-dev
>  T:	git https://github.com/AsahiLinux/linux.git
>  F:	Documentation/devicetree/bindings/arm/AAPL.yaml
> +F:	Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
> +F:	include/dt-bindings/interrupt-controller/apple-aic.h
>  
>  ARM/ARTPEC MACHINE SUPPORT
>  M:	Jesper Nilsson <jesper.nilsson@axis.com>
> diff --git a/include/dt-bindings/interrupt-controller/apple-aic.h b/include/dt-bindings/interrupt-controller/apple-aic.h
> new file mode 100644
> index 000000000000..f54dc0cd6e9a
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/apple-aic.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_APPLE_AIC_H
> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_APPLE_AIC_H
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +#define AIC_IRQ 0
> +#define AIC_FIQ 1
> +#define AIC_IPI 2
> +
> +#define AIC_TMR_PHYS 0
> +#define AIC_TMR_VIRT 1
> +
> +#endif
> -- 
> 2.30.0
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
