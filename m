Return-Path: <SRS0=LkPm=LG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DEDC48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jun 2021 15:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE2861287
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jun 2021 15:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCE2861287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1sprphoFXCEX4i0k/90korBM4PNuArlOYPzAlBEmQI=; b=MpC/MLytqsHA+P
	MZ/8BW1DZZNre3ARVEsd5gu4XOX7mkx3nFtjt4ILDhhl7td/usXs4MtAEQwVzVGadC6UYGNxNPh3d
	3QGriSHOu8Fpf8IQv9UVRvN6aervaxv68SWnJTUjCcskxNpG7Rn878lXHz/HMe8CDaT+V6regAFun
	n0uazOCCxE6jhFhcM1O+hsfQ7Yth0HLHKyD1ApifBbv1MzNvuxsYd+3Fh5IHeybVYkiaCNun/TH3N
	sfggPe8fAq8qWNyydXCmTc02ZhzmaBfGkWRH42J064zw5r0n5+7iyf3ysUYXI8jLUIh63ZqBPXwS/
	9gXikPVGiDbY8A3uROpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls5Ft-008hLr-2f; Sat, 12 Jun 2021 15:09:01 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls5Fq-008hLP-7s
 for linux-arm-kernel@lists.infradead.org; Sat, 12 Jun 2021 15:08:59 +0000
Received: by mail-ed1-f52.google.com with SMTP id s6so40596938edu.10
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 12 Jun 2021 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MyHAGIpkkv5FhdCV+dmubHT6fI0J4Qtzj9J4fslDtcQ=;
 b=W0TBv8YxPCk0CMIX/i/QLdgS9KiKeQNoLDvGMD8SlDDMPEk6JkrNmNWNTTwzESG1DS
 VocDE82KQpTdDCqbqJn9RnvauCxSTCdFPH0GvzqxPLAfzKxYE5RsZ4RIbhMQ5LDR+H35
 zoRR+nzmC0a1z4dA97a7ZhTm6+eH4/zUC47HyMZKzVDU59gg250UVuGDeaVKnCvFbjb0
 GJ2HEvLaGKba8mdh7LQ0i4DLMzZaRLWsayayPUaFwVAY054QBMNB2YrSpcOJtc/LEEB+
 va0d42hOiUVzQa60NOHtISexG3n0qBdKgrIAy6bwb1z6ZtPsemBkGGQjvIXwkf+puHb1
 uJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MyHAGIpkkv5FhdCV+dmubHT6fI0J4Qtzj9J4fslDtcQ=;
 b=kvQlzy7lyU5QMxeHAOawBIQeRR57DvIgTpAelW/UjaIYf2hZG4Fe+icSDBHLkjf2hk
 PmfRJ3N27Bkk92orjUWh1w9aGwJXUXonKAe8c3QXo/2eGu06BUoGL6TW62cwuZpOra4J
 Vv+bq92w87/y49C4OXrxjNZMJiFz8sa6CWhFFobzjgsfBlD1Fh0ucGqfWBrzo+LeJRL9
 YvzDxZzsyoVyI4N91P484wOW+Puf4hrJYqIWQR1U3bLqfVX0iyN9F8VltpggROwewt9a
 lsJpwnNfZcnTdteEQ/4CXq4Ig5WZRnosrp/f65MXSrwnjrRRuIN4gvxsL3ZAg44WGAP3
 +Ilw==
X-Gm-Message-State: AOAM533RNq79RMQM7YVoXYNXCacWeT9BuXi6LPVEjK65r+U9T9jb54zl
 Ph5KOrLLBOs9LKJ9gXbknAs=
X-Google-Smtp-Source: ABdhPJzxp36MU7OxaYVh1dgVnXetWoZR9dLwm9Xiwc/QVPJuVTP+udohcInDHSZkGVZKBTRk6s1urA==
X-Received: by 2002:a50:d943:: with SMTP id u3mr9250028edj.175.1623510476839; 
 Sat, 12 Jun 2021 08:07:56 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id n5sm4002476edd.40.2021.06.12.08.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 08:07:56 -0700 (PDT)
Date: Sat, 12 Jun 2021 18:07:55 +0300
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
Message-ID: <20210612150755.efb5hw3xujkkh2va@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-2-mnhagan88@gmail.com>
 <20210611194644.64lvhvp76wy6guqp@skbuf>
 <f0af3f0a-ab13-ecdc-d834-c95ddcb52866@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0af3f0a-ab13-ecdc-d834-c95ddcb52866@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_080858_313867_8A6FCCCA 
X-CRM114-Status: GOOD (  24.81  )
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
Message-ID: <20210612150755.ufptmQQfbsZVUkvwQMPhY2V7FDcKM2lDwDl2RTJqWgc@z>

On Sat, Jun 12, 2021 at 10:21:31AM +0100, Matthew Hagan wrote:
> Hi Vladimir,
> 
> Many thanks for taking the time to review the submission.
> 
> On 11/06/2021 20:46, Vladimir Oltean wrote:
> 
> > On Fri, Jun 11, 2021 at 12:27:13AM +0100, Matthew Hagan wrote:
> >> Add bindings for the Meraki MX64/MX65 series. Note this patch should be
> >> applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".
> >>
> >> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> >> index 78dfa315f3d0..7d184ba7d180 100644
> >> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
> >> @@ -62,6 +62,12 @@ properties:
> >>            - enum:
> >>                - brcm,bcm958625hr
> >>                - brcm,bcm958625k
> >> +              - meraki,mx64
> >> +              - meraki,mx64-a0
> >> +              - meraki,mx64w
> >> +              - meraki,mx64w-a0
> >> +              - meraki,mx65
> >> +              - meraki,mx65w
> >>            - const: brcm,bcm58625
> >>            - const: brcm,nsp
> >>  
> >> -- 
> >> 2.26.3
> >>
> > I think these compatibles describe SoCs, whereas Meraki MX64/MX65 are
> > boards, so this is a miscategorization. Can you not just describe the
> > Northstar Plus SoC that you are using in your compatible string?
> 
> My understanding is that the bcm958625hr and bcm958625k are dev boards
> using the BCM58625 SoC variant of NSP. For reference, a close example
> can be found in brcm,bcm4708.yaml in the same directory:
> 
>       - description: BCM53012 based boards
>         items:
>           - enum:
>               - brcm,bcm953012er
>               - brcm,bcm953012hr
>               - brcm,bcm953012k
>               - meraki,mr32
>           - const: brcm,brcm53012
>           - const: brcm,brcm53016
>           - const: brcm,bcm4708
> 
> For the compatible string we would definitely need to specify a unique
> device name for identification by the OS, rather than just the SoC.
> 
> Of course I could be mistaken. Will await confirmation on this.

Yeah, ok, fair, after rechecking I think you're right. I'm dropping this charge.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
