Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MISSING_HEADERS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84FCC48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 18:07:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC361613AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 18:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC361613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:Subject:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UyuPfqBSAXUHrAmmN5mdZHeJqlwdxy/sjjFEmaGBEr0=; b=4ax7rJhObtwI1aMuzGcILM9M1f
	CQXhM4tINYyA5PffEc17WelXo/BcV9fDWNeXTYWQ1789dCu2XQQxsA1+n5ysofDRAP2WtxFm4vXob
	9KIX5brcTfMZZbre6bI4TVN4pwxvlmTGeiw61QT++mh/9352H7oJz0LWJGrxpThm0fAllgIzUguYR
	6o8q6X04YvG5UcJ3uaghCB9u4JQ612iqHkF4Ze3nXNOyNnl82m6IR7QoUOXMNmPi/FNRqat2aH91T
	5YR6JtaB2/oEZbmJpARKwOstUcSlHQS9FQG/LgjoU1JUcyAPc7exXz3OGx86rwI3NUB5h9D7Jsn2p
	Ix/H/WUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrlXG-006QKf-N7; Fri, 11 Jun 2021 18:05:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrlXB-006QFu-AU
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 18:05:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id b205so3842989wmb.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:cc:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=bN6nTLxY4EsdLFWLAWGteRiQWDdS+7C3QFVM088ASFE=;
 b=MM4COoLSA7xG8EChlBEJ5B1a4kKgW8GYL3rFLe6rgXd6dn1J+MOxxh8OBahI8Hf3qU
 +IJVTL1QnCphHj6oaxN+dt+SObRs3mRxsjlRmjvRxbEArc50YKYVF9yHU0ZvZO09yMwC
 znDdwS39pU0jkxg6Js37O8sxuwXXTUBffOZuewsnqSGzGs+u3xOVwfQ1iwXHo+aw+vIV
 YDP2acm0m9nDjx6LypqbhkCFNS4twy3JWewxVb+u/uVbEpyNkTPgOxeNglCF7gpyh+jQ
 ANxc/c0GKqCQBa7u0xibwBT4hYPzrrcqUlWKf4t6IAh92oXBzAr9b/WiHYtvOhw0bCAe
 uZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bN6nTLxY4EsdLFWLAWGteRiQWDdS+7C3QFVM088ASFE=;
 b=gbMpzPfPJocz90g8uv+E2KHTIfIn8hy9dCBYYu1NOkR37FfFhWe6PQXFLrzV8STngI
 xmSyGJBs+SihaGZmDKvm2c+nnswsRTc0BmrEdLgiBDIKjyJNgbyYZYnO+ImUVp0aTmeL
 wfQiWlDjmpxWpB4ATBgLZQtaPob43Fq/wn70duI8lCpstbTpS6Z2LT7c/UkhtptaWwQz
 zvf9c+yZp+QdLev7OJBGncNDYuddTSO1rdSCyseg6njO6+HMcCq+15/QCOwdfJ0uSAHP
 CIlSkEeU6brQ3bX31Z+p+7VR5o7pxFQpveMxoJhD0y0Q74sEXvhpHAyWMAg3GxmlD2Qw
 eJDw==
X-Gm-Message-State: AOAM533oowkd0vwEIZd01J4lT45xqMxpHQjhwQcwfUKqvfAJvcB7gpH5
 UiVQ9Rt41M1Da6p/4We0QcdF7EPLsm6S1w==
X-Google-Smtp-Source: ABdhPJzIrCFOo0eiP8MxWhbZw3VV3cxplb7U2Gsw28q2AGWfsBBjPEgKHks424+y3z36m1ru4TB1Ug==
X-Received: by 2002:a05:600c:4f09:: with SMTP id
 l9mr19610113wmq.114.1623434731861; 
 Fri, 11 Jun 2021 11:05:31 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
 by smtp.gmail.com with ESMTPSA id a1sm8888617wrg.92.2021.06.11.11.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 11:05:30 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] ARM: dts: NSP: Add DT files for Meraki MX65 series
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg
 <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-6-mnhagan88@gmail.com>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <15622641-7689-551e-3e56-35a9eed62828@gmail.com>
Date: Fri, 11 Jun 2021 20:02:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610232727.1383117-6-mnhagan88@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_110533_446245_3978BA45 
X-CRM114-Status: GOOD (  14.31  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611190214.V0YJEdedcQfwuoyM6Z_c8z-fzUyeg-NJGxZV6wApM_Q@z>

On 11/06/2021 00:27, Matthew Hagan wrote:

> diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
> new file mode 100644
> index 000000000000..0045a33055c1
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree Bindings for Cisco Meraki MX65W.
> + *
> + * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "bcm958625-meraki-mx65x.dtsi"

Should be including "bcm958625-meraki-alamo.dtsi". Will fix in next version, subject to any other feedback.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
