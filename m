Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFE6C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6692723B51
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6692723B51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qk450N1/iore6Byb8y30jwq4P/zHc6oft3LVAj/fqs8=; b=q8xVI7AO7cfub8ziRGOx1bfKB
	Y13F2S22f+GeGs5sPnkpQPgDWjTuBxVBPFnaqV1UydIVchAlyFhMbe4w0l0BFPXsRuw86beu66hvr
	7o+/AArVY8boduunj+59WgZlr+mOwDFXL3vdvO2/MnxlLhW/rOX0VywDIuk8hwIZsJH4oFCMbhAWk
	MWxhfqDIRtf73TclorvamzKAxhQDlfwjVNV3bXyGHVGbzQFwEiMdiXI8Xgt2OxPPZLnYhfA3AtVQO
	a15GH76YV+/TGlnhixzKBKzy1fSw1KEk5pYj++spVG98eG4An69Ti8OvrnHjpValVEy64cjwWE+Sl
	Xi0NU7WvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2RL-0007p2-9T; Wed, 09 Dec 2020 16:35:43 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2RH-0007oR-5v
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 16:35:41 +0000
Received: by mail-oi1-f195.google.com with SMTP id d189so2313084oig.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 08:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/5eXeZ1rOl1SnuLrH50s341Cy25jly+HKj6684KUWPc=;
 b=au0vD8ZBluKAGwRInHDwYHgK0fmrCNk8mYxtHV8O7uAija4gHWqzupu2CEtnCr5Qf9
 CTDQJLn8ldmS6/q/c51X90FCbZnGPEJou6GsG6JeGwiamp7xHXmFRFFLTb98be10PlbN
 UgQRoRIOP084BcbzB77walPfZ3zpsOJmbAxcIK2UNrdVzCfAdzis5YVuysWi7UEmQgOk
 0x11k9zstBd81tLYjfBBM8RF+BVfNBrVo/tmt6yke/wUnTorqRINsp13+qqLMyfz4BjK
 5AYLnAb1fVlqQ10mr3B1QPmOnrQs4fHuQRTB0B+cgM70h8SmcrGD1Sc+dEQq2eiJ+F8Y
 Io8g==
X-Gm-Message-State: AOAM531683v9VK0COwr27bTtq4sN7U5TFMyJKf1FY67ffonwtAT8YdRU
 uwwfgjZ8YctHzOpDM7+EbA==
X-Google-Smtp-Source: ABdhPJyRz0Ow15DwwuB85ognDOjEEsa6IIR6nWF8zZkU2X8hroQcLUEZZWkbV0eiPUgWqqrlivMqdw==
X-Received: by 2002:aca:d5c3:: with SMTP id m186mr2314853oig.73.1607531738289; 
 Wed, 09 Dec 2020 08:35:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r12sm413774ooo.25.2020.12.09.08.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:35:37 -0800 (PST)
Received: (nullmailer pid 569438 invoked by uid 1000);
 Wed, 09 Dec 2020 16:35:36 -0000
Date: Wed, 9 Dec 2020 10:35:36 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for
 mstar,smpctrl
Message-ID: <20201209163536.GB566058@robh.at.kernel.org>
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-2-daniel@0x0f.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201134330.3037007-2-daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_113539_259746_B1E27AED 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 soc@kernel.org, olof@lixom.net, w@1wt.eu, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209163536.gPodJP3HX-74EIXOyAVzyhHempOCiashxa1yLDZwDnQ@z>

On Tue, Dec 01, 2020 at 10:43:21PM +0900, Daniel Palmer wrote:
> This adds a YAML description of the smpctrl node needed by the
> platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.

You need an 'enable-method' string defined too.

> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/arm/mstar/mstar,smpctrl.yaml     | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
> new file mode 100644
> index 000000000000..599c65980f5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 thingy.jp.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mstar/mstar,smpctrl.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MStar/SigmaStar Armv7 SoC SMP control registers
> +
> +maintainers:
> +  - Daniel Palmer <daniel@thingy.jp>
> +
> +description: |
> +  MStar/SigmaStar's Armv7 SoCs that have more than one processor
> +  have a region of registers that allow setting the boot address
> +  and a magic number that allows secondary processors to leave
> +  the loop they are parked in by the boot ROM.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - sstar,ssd201-smpctrl # SSD201/SSD202D
> +      - const: mstar,smpctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    smpctrl@204000 {
> +        compatible = "sstar,ssd201-smpctrl", "mstar,smpctrl";
> +        reg = <0x204000 0x200>;
> +    };
> -- 
> 2.29.2
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
