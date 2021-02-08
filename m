Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660CBC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 10:28:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F6564E45
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 10:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9F6564E45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CQ6C1EHRTQg93AA02/9i+uCPCvupa27aJez0kfYN0NI=; b=FmsmJUajl6qFVw0r0u3JOQlip
	A6QupQcfGDF+VX8t36a8VPEF5rPa8+ZKX53cGVfU7tdm1TT7mre26cUMl+J75fafscplsTthighXz
	vdatieUTZOs9oL7fKNFEK3Z4mdK3dZmbm0nxaZj9BQL+7a1a/DlWMgQJcxchEGNPPoIA1sHky3HxH
	RGB44SqrEPz7AHratzZfWkPbssDrNSt3mDYEyG6d8v8HSPScSxmwtCt6+0dGB/dvETh8cwAhpHSl7
	BTRJMEqBat9yQY1Y4Vw5mSPMHSilsJiVEsxeMYbGvXkt2l4VqTghGDf6rlIHjUwGGvqRQY7zqlEr0
	g5iL+I72g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l93lZ-0006uN-9G; Mon, 08 Feb 2021 10:27:37 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l93lW-0006th-F8
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 10:27:35 +0000
Received: by mail-ej1-f41.google.com with SMTP id w2so23667886ejk.13
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 02:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/sXUHbfTSNaWe0Vrtyl40wVJaY9DiX1LwKI8X9Eee5A=;
 b=kKD7743a5ZGngId4s9F0VAcSkXe1BjenDCOoX/cTj0VghjGxls7ha0QXsTZHZKDBTc
 B9SQBj4b3jnVqv7II3bfkB2TRjEmb7D7j+fAzrwbFID3idXk5m+ni1hqIcusySujigUG
 KDD2rQVzQfM7XWPlSavhrUZb/UjWM6OfeDmDsLQ1vmUgoGvjANWnmmm0+xxN9Uer0/jO
 VOuNw5El3bZzjk/wDszj0FLdPlU4J/IymoKNtPjcI/KCxqFIJdkiTpo9Ym97KAgbfLCq
 ekpEuGh8YAXcnmFDPn9M03dOmFmXDEijWBavDrQdwjyfWJsCA0WdvjcpUBWW1RA2Z3aC
 x1Zg==
X-Gm-Message-State: AOAM531/96DPObml+1BOLKZ26Z03Rau0qftJ33gVW3gZgvyZKzhlexuM
 RP/E22wuv0IgvBLpdTdQCsY=
X-Google-Smtp-Source: ABdhPJy0w+9yYbPmP5ReyAJ8xWSe+CjI2MLaTbf6iSDnOvs1rvvIS/VC0J1GAivNVnbfEQN34Rlpyw==
X-Received: by 2002:a17:906:6bc5:: with SMTP id
 t5mr11941692ejs.253.1612780053394; 
 Mon, 08 Feb 2021 02:27:33 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id b3sm9289294edw.14.2021.02.08.02.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 02:27:32 -0800 (PST)
Date: Mon, 8 Feb 2021 11:27:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
Message-ID: <20210208102730.p4nhsl35oowsklv2@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204203951.52105-2-marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_052734_526019_7BD263A0 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208102730.fpgODS5YR40ke0TvabhVI31KtOPs4dXjFHThsLT4jU4@z>

On Fri, Feb 05, 2021 at 05:39:34AM +0900, Hector Martin wrote:
> Amusingly, this wasn't yet documented, even though this vendor prefix
> has been used since time immemorial on PPC.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 041ae90b0d8f..d7950c723472 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -25,6 +25,8 @@ patternProperties:
>    # Keep list in alphabetical order.
>    "^70mai,.*":
>      description: 70mai Co., Ltd.
> +  "^AAPL,.*":

All prefixes are lower case... see ABB below (not mentioning that the
company name is not APPLE), so just "apple".

> +    description: Apple Inc.
>    "^abb,.*":
>      description: ABB

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
