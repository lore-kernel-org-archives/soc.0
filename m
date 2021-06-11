Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20AFC48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 20:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBB061246
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 20:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBB061246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/VPRKhm4WN0PeTOtCZG5raZR/nHfthMZm/pZkcce8w=; b=Ue9MsGuZFFWmbR
	t5T43qShK9f55Q3JOgDV0Zb0Ru3I7wJH0fFTlDltx2Gbmgyrjnsya1jPZT65+fUUIcJCvtXCEsgaE
	8y6K8byOiejj4FLKcGyKzr6V99gx3cPFT7EAlnrxgT5uCLBcoJwNWmdiuvsWMOGr6kaDhc3A6WBxO
	U0/6hhT3CJD1kPTY29Dp0A5XUI2onNIJfebKsKj0XeVI+Pv9Q2SISTbOLyAhV+ijwxKyFSD6WClt6
	e1Mi0gkwK8OK0gAgsE3uoqHMTl9Q+Iro4bu5szCjYjum+u8238oySmXbUlmvW2NGlVm+Srjqw1lMu
	uAiOawf0XBb87aKe1mqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrnmQ-006uNY-35; Fri, 11 Jun 2021 20:29:27 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrn7B-006iee-MC
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 19:46:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id ci15so6155114ejc.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C6C9XAc/4o5g/nJl5oV+VV5fk+Yq/QDQ08tqYJKVlN8=;
 b=Wr7Kz7qyfO/ySRu0Ur5oh4v8IOHFu8omwbVz1962faGV6z+ITUn5KuX1jAG8TS3aaK
 38Y5LWZipl+cT7CCjzqAEBNuaFWBQYdqfW1H+5+6Lt5EG720ZyzFkIMcTcl+OjuFRlSa
 1XlypvFbDDLNScs0lkW0/HZT66ck3oqM/FyMxwKAeo4o8OwF0+vbD2b/quzziHxXWW6d
 pidse3IlAvV/27stXoJhYAvK3j0oalHBWdCtu9CVifIKhqi3wF+kuOid+KRDOkOZL/Qe
 LZelQiJQ03l7fkbwK73jwDQ1mz1FLjgp+ReFtkMynml8Dd6zmR5KO1KUkt39XleFQ0HV
 6lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C6C9XAc/4o5g/nJl5oV+VV5fk+Yq/QDQ08tqYJKVlN8=;
 b=H7mWkX/k3rfy05NApyW5rrOPxd4Hzs1aEwyGMMd+v1UIJ4eRuXuo4xULAa6UkaFmO3
 JvFRKNKCkQa4Gd3ssdOvAzkvL66cxfN2gH8QcU2y2WivioaNOyAfx0J6erhv0mdMujiT
 qMKI6bo9FMO1PS2zbQ5Gcz4TXqmuk/Kc7MtbKyVDo6Skm02RwbaZwkXELDl3ebCN+Xq3
 MMZMD2uXWeRKD7GcDYBD8x1iThCTbccwXN1i49vIN7M7j6TE5vQ/DLGk+KCwwI7q5DrG
 MNfSMAfdjIos8iHapNpLIUlq0dgiXqOEp1c5uh+0NY7rifmogL9M1tF0l6JHwHKvxwVI
 RDEQ==
X-Gm-Message-State: AOAM5335yIteQbOyAIHx61WVz3E/yFomDp4nG/xv8t3Kdrma8Pxlevt+
 wevc+qPjZ+JlQFQ2SVfPb/Y=
X-Google-Smtp-Source: ABdhPJxfI9du5pPrBGY5Y+smBF61rv+3CBid1CuZMbtYk5u7WBPWybqvRdM2AW0rcmkmc37DxDvXjw==
X-Received: by 2002:a17:907:948c:: with SMTP id
 dm12mr5060138ejc.484.1623440806641; 
 Fri, 11 Jun 2021 12:46:46 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id o64sm3011500eda.83.2021.06.11.12.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 12:46:46 -0700 (PDT)
Date: Fri, 11 Jun 2021 22:46:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Message-ID: <20210611194644.64lvhvp76wy6guqp@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-2-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610232727.1383117-2-mnhagan88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_124649_790791_B632FD8C 
X-CRM114-Status: GOOD (  17.39  )
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
Message-ID: <20210611194644.BaqNwhwoQnDH_ar524uypRDDpn8aSEytsbpeFImQZsA@z>

On Fri, Jun 11, 2021 at 12:27:13AM +0100, Matthew Hagan wrote:
> Add bindings for the Meraki MX64/MX65 series. Note this patch should be
> applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> index 78dfa315f3d0..7d184ba7d180 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> @@ -62,6 +62,12 @@ properties:
>            - enum:
>                - brcm,bcm958625hr
>                - brcm,bcm958625k
> +              - meraki,mx64
> +              - meraki,mx64-a0
> +              - meraki,mx64w
> +              - meraki,mx64w-a0
> +              - meraki,mx65
> +              - meraki,mx65w
>            - const: brcm,bcm58625
>            - const: brcm,nsp
>  
> -- 
> 2.26.3
> 

I think these compatibles describe SoCs, whereas Meraki MX64/MX65 are
boards, so this is a miscategorization. Can you not just describe the
Northstar Plus SoC that you are using in your compatible string?

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
