Return-Path: <SRS0=GF4P=IY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46957C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Mar 2021 02:20:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D439161A2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Mar 2021 02:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D439161A2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oW2icZanTsG6MBmVEm2k7BWz5IvVRfzMYEkkdormG4E=; b=FiBhbGQbNjC7BBbTbuvgxf1qi
	rY1fkXAIqYE0GNDhUW4i2mjPVROX2LOHCEZtGfpfFP9IVSv430k2WylRMQxLmryYl+m6Ta34h0GPe
	KFnFqxSPIzTX+aFW330MATs6tgmvYVaCcK50vWeQhR5+qyy2tZzpLVgWP8NLK49eJm8rRvLo6fOJM
	tTI1V+bzxYABIZNYnb8R+4P377GWk97Zz+To0W/nymoLSk918D5yTLgdNl9b8YaV9Wj62XoIUScFZ
	eokkNr8owYhjGnaMFPVvq0EabniN0OcWUenjj6EQcSz3JaMZGOJZESIviudo67m+E2kiG/oqKFepI
	Wl753G7fg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPc2t-002Yfp-W8; Fri, 26 Mar 2021 02:17:56 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPc2n-002YfE-Fj
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Mar 2021 02:17:51 +0000
Received: by mail-oi1-f172.google.com with SMTP id c16so4276145oib.3
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 25 Mar 2021 19:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pN6nWQzQZ6AQx0kJQTtGWLMXZDRLpSHjIhqC/t+YFhY=;
 b=P0KXzeisd9//fbUfR/6Mh28NxBkI5FJH2IHucuOCJw+eDLLEgVPFxxQEaYoR1VotPD
 s1USoLIeu0rkKyNnzVXSA/pAbuKmcjEIb40VLtVgSIW/dci1Y7XFtyCsssd2tQnYwB2I
 bulstwyFMV4mpTINySsVHc7SD/gYkKuISvRd5rJ0/kbL4uQ+B/Ia8/3d+gWlfYXpHQaM
 IavL9N6YA3JlP7MsAMVRYN8iyFA78Q9ihD6fSqf9QIIaMWsliIOcqRwfHYOz8hPUMpcI
 IBD3GznOdTOpmKU1mPla4VZGDMWarlOTrnaBtwoD0PyedotMvJtkWRt6UN9uZllbrNIx
 bDtg==
X-Gm-Message-State: AOAM531JT4Ru2VBM7VYt5G8Xx/+fYsfimzFLjHIjyjCHYZbOe6jXeTZR
 0cQMSNjWBJy6JBIsIk/xwaYZuhfpqEc=
X-Google-Smtp-Source: ABdhPJxB8doOdAEjBnMSBfPNnTGUa6a4PqJVcsxN3yWOnRm7fsaVasWOa5mP/32PNj8MkoacJbF3sg==
X-Received: by 2002:aca:57c5:: with SMTP id l188mr7970754oib.159.1616725065953; 
 Thu, 25 Mar 2021 19:17:45 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com.
 [209.85.210.46])
 by smtp.gmail.com with ESMTPSA id y10sm1449040oih.37.2021.03.25.19.17.44
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 19:17:45 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso3890908ott.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 25 Mar 2021 19:17:44 -0700 (PDT)
X-Received: by 2002:a05:6830:20da:: with SMTP id
 z26mr10108692otq.74.1616725064425; 
 Thu, 25 Mar 2021 19:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131530.2619900-1-arnd@kernel.org>
In-Reply-To: <20210323131530.2619900-1-arnd@kernel.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 25 Mar 2021 21:17:33 -0500
X-Gmail-Original-Message-ID: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
Message-ID: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 YueHaibing <yuehaibing@huawei.com>, 
 lkml <linux-kernel@vger.kernel.org>, soc@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 Madalin-cristian Bucur <madalin.bucur@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_021750_088054_72F181D0 
X-CRM114-Status: GOOD (  21.76  )
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
Message-ID: <20210326021733.qwNmsNPOHtTVFdp1ePq-8t0hJkkJ_d6goVwy39esL-0@z>

On Tue, Mar 23, 2021 at 8:17 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When building with W=1, gcc points out that the __packed attribute
> on struct qm_eqcr_entry conflicts with the 8-byte alignment
> attribute on struct qm_fd inside it:
>
> drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
>
> I assume that the alignment attribute is the correct one, and
> that qm_eqcr_entry cannot actually be unaligned in memory,
> so add the same alignment on the outer struct.
>
> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/fsl/qbman/qman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index a1b9be1d105a..fde4edd83c14 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -186,7 +186,7 @@ struct qm_eqcr_entry {
>         __be32 tag;
>         struct qm_fd fd;
>         u8 __reserved3[32];
> -} __packed;
> +} __packed __aligned(8);

The EQCR structure is actually aligned on 64-byte from the manual.
But probably 8 is enough to let the compiler not complain.

>  #define QM_EQCR_VERB_VBIT              0x80
>  #define QM_EQCR_VERB_CMD_MASK          0x61    /* but only one value; */
>  #define QM_EQCR_VERB_CMD_ENQUEUE       0x01
> --
> 2.29.2
>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
