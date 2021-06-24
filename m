Return-Path: <SRS0=ak/p=LS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A57C49EA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jun 2021 20:24:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68F9613BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jun 2021 20:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A68F9613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAeMtwk+fTMCNZ7/eCB0toNW6Zuwtu7eMKA86sd4Mso=; b=Th8clwy2ryv2QD
	iWRlDumekXXoqJWvDm5xS0B5tVqVWIB7sRpADrZ8qpMzhMw+pwEtgvztrIoxRUbQme0bnZPnitG45
	UeKnQXn2l2F0lyNIfIfndAT2/He0mJRoQgg2q9tLQpBa3rEolENvXTg7x8h6wmoTJxhyvaMFBXxm+
	Pln39SFFNAkOYp33aHV6y7BybO+HDBxmtPsjQ8Ak2CoK+NczwOvhdmeC6pXh92a6jErJiNUHN9oV8
	wJDeVGbHjcmacD1VLY2ztyVaWQhn6M8PoN+FVsvh67TpeU7HPHbn7DpDaw8/SdvBFVUW1I9dNy+fn
	cB6GSgwQqKAfx21CmKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwVsC-00G9e7-NI; Thu, 24 Jun 2021 20:22:52 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwVs4-00G9dZ-7V
 for linux-arm-kernel@lists.infradead.org; Thu, 24 Jun 2021 20:22:45 +0000
Received: by mail-io1-f50.google.com with SMTP id g22so9915247iom.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 24 Jun 2021 13:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=knEwkp+Z8llmgr1VJTsCXisfmU+yU/tJNLrDFp/f5Bg=;
 b=WXE1OolyHE9nJTdMbEehZvPGZ7NWpW7QdSrSf3/A3wiNM6CLl4ToQtN2UhGliMK4UB
 YxBS17YpT8E+9C/ap1KlrJSZm0Fy/ylfLIhSA5g+LhjqLpPelFOVJOmEsYXPHQTHBnYa
 gQwgF2Fz8hf9T56lroW5QhjyR/py4FEUGNA3yINIKKFF5/dKqTeitZePxmUKg7Mi9TOW
 /0/FLUEDORBXAlipgtvm6Me9rxVodWTX0ZOAirzoxWd3zgbd0HRNklGHWSWls0ZZRtrM
 aWKj5cLLsiEu90xfb02cLhoPTVN2MsHNMil1DSDUYSlVOJM/o3ntEltFmX0nn+VrQVjM
 uefg==
X-Gm-Message-State: AOAM532NjNPpHF4xsRfcD9DSgoi6gOdymK/px+hFLiiQ0h8u+OhJbmyK
 C9JRphNT6CxtUFqvog0AwA==
X-Google-Smtp-Source: ABdhPJwobF8PdC0NO8payPPWkGXZGT2rK/e9rI/graPZ4wi+ob3vqdYIhC/ZQ9+WAp50FD9qqZtjMw==
X-Received: by 2002:a5d:8b8b:: with SMTP id p11mr5674403iol.77.1624566163505; 
 Thu, 24 Jun 2021 13:22:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g8sm1954736iop.31.2021.06.24.13.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:22:42 -0700 (PDT)
Received: (nullmailer pid 1927038 invoked by uid 1000);
 Thu, 24 Jun 2021 20:22:37 -0000
Date: Thu, 24 Jun 2021 14:22:37 -0600
From: Rob Herring <robh@kernel.org>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>, soc@kernel.org,
 devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v3 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Message-ID: <20210624202237.GA1926990@robh.at.kernel.org>
References: <20210613101658.3242777-1-mnhagan88@gmail.com>
 <20210613101658.3242777-5-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210613101658.3242777-5-mnhagan88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_132244_317308_F939CA15 
X-CRM114-Status: GOOD (  11.92  )
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
Message-ID: <20210624202237.rDZsBfekj_yJhy6BN6A3C47fgI213kYyR3bnvvMHPPU@z>

On Sun, 13 Jun 2021 11:16:48 +0100, Matthew Hagan wrote:
> Add bindings for the Meraki MX64/MX65 series. Note this patch should be
> applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
