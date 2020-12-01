Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4AFC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 21:22:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4FF20870
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 21:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZUPpCoq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4FF20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=asHTukMwJcooJPI/osL2YeqbMHVA5xVK6DIYsfS9u5Q=; b=cZUPpCoqV5syEob2uYcECRMvx
	b/yNQn6XufuZbzO5fYQAcNaYyfAmdaOS/0MaoAdzv9H3U0+taAQH0QPivIpAvoX9dHuxlgVRo2323
	F8WDl4FcaPidMRxDRMd6YyF2bbtw8kJZ9TBWtflm0Vx25c3P4gb0EImGOT39hnoJKbKoF4ePW17rz
	is/BD/tBvaLX/Z7qle4O/YwJoFn+FoRbKNMUMJGMBbQyEjAljup//lfR9/kPLWkPr862r6ShKslm8
	tFEiylwlfaETFNpKN+QosW1F2qx176fdBS3JkCW9GAoqmNex4Ad6ZjYULmFdic0rG3braZwE8qmpn
	x268mgGkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkD4q-0003ll-3P; Tue, 01 Dec 2020 21:20:48 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkD4n-0003kq-Bc
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 21:20:46 +0000
Received: by mail-ed1-f68.google.com with SMTP id c7so5585647edv.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 13:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eJ0wb6xnXrJobv0CqBcs/xjzvsOoM4mG3SkfXYuB3W8=;
 b=eN+KEkeEiDpEa10aG+KiNK3Jnb4vqbh2HYu2HXS8E32JUOcifEI1dE+3IywvO/5PBr
 b84goV96JU4BlYZFzsHk4PBuDA3DccuTphiFczWbEKxuNt+hIQsiEen4LW3YIIwFxFRF
 cpMH+seYYGkq+/CW2JMtXloWLy8U1C83bRoWAalXLqVstsUC5oHL+ELf6+BSE6tJDkz+
 Sfwv9GEjVTi/togw4j24DHxXdXvRQSLycSNJABOh0hxMoU0emmBgsmvGJsRAfUB3YQNV
 MChkQwYCOslCEhmLguoOmK6AEhPaaHiBHG/RcLKTKqB0tCFuhIkwX7qa7tRV/A+SufJA
 lxyA==
X-Gm-Message-State: AOAM531GmLt9yOfE9cXarktqWpTb/awMt4jNANvgSlxq0xXzUZo/V2Ul
 u7txoRlkBrRwpvw83Hp8hFs=
X-Google-Smtp-Source: ABdhPJxzslphSfUsv8Kk92K2o1vbUwxh4il0VxCnEPq9zbo6TLitC7qhTUdgERRFyKENJaqFHstDqQ==
X-Received: by 2002:a50:a6c9:: with SMTP id f9mr5074768edc.158.1606857643806; 
 Tue, 01 Dec 2020 13:20:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id ot18sm417255ejb.54.2020.12.01.13.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 13:20:42 -0800 (PST)
Date: Tue, 1 Dec 2020 23:20:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC 2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
Message-ID: <20201201212041.GB23379@kozik-lap>
References: <20201201211516.24921-1-krzk@kernel.org>
 <20201201211516.24921-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201211516.24921-2-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_162045_441471_A924F427 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, arm@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201212041.jvJDY1RMsH7RFGmejXayG_YTzpPqxCVqinzfx-ePLjI@z>

On Tue, Dec 01, 2020 at 11:15:16PM +0200, Krzysztof Kozlowski wrote:
> It is expected for ARM and ARM64 SoC related code to go through
> sub-architecture maintainers.  Their addresses were therefore not

I reshaped my message last moment and missed that it does not make
sense anymore... It should be:
"The ARM and ARM64 SoC maintainers addresses were therefore not..."

Best regards,
Krzysztof

> documented to push patch traffic through sub-architecture maintainers.
> 
> However when patches touch generic code, e.g. multi_v7_defconfig, the
> patch might not be picked up by them and instead should go to the SoC
> maintainers - Arnd and Olof.
> 
> Add a minimal maintainer's entry for SoC covering only Makefile, so it
> will not appear on most of submissions (except new devicetree boards).
> It will though serve as a documentation and reference for cases when
> submitter does not know where to send his SoC-related patches.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6149066a545e..f302983645bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1491,6 +1491,16 @@ F:	Documentation/devicetree/bindings/iommu/arm,smmu*
>  F:	drivers/iommu/arm/
>  F:	drivers/iommu/io-pgtable-arm*
>  
> +ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
> +M:	Arnd Bergmann <arnd@arndb.de>
> +M:	Olof Johansson <olof@lixom.net>
> +M:	soc@kernel.org
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> +F:	arch/arm/boot/dts/Makefile
> +F:	arch/arm64/boot/dts/Makefile
> +
>  ARM SUB-ARCHITECTURES
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -- 
> 2.25.1
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
