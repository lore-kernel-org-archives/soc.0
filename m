Return-Path: <SRS0=hxhK=OB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0D3C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 02:59:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4165A60F38
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 02:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4165A60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu1k6tWnb7j6y9fzGan7IHCzYTP0+B6orcfmruWRn3Y=; b=LxiYz8DH3EUFRc
	UkNRFtaW0M6y4P82vhG4Xvm/uHaTlBTwcj56tGuvYSvRHn4sI4dfyUdlc5VSrM4SbROU3RD1H2bsI
	4zM/URr/+tXdZpCjbsA4HagYPZ+2Z+VTMZb9AAxC0pq/Ule+tTx+7LluZfrco9yRacUO0z7nxg+7D
	PbYH9wrkH6KAfLNF1jX4M/vbuc7hRO453a09mI/tuCyqjukGW+zV66NzLxaM1XuaVhKmn3yVubEz5
	GpzMJIVIBrNI/ggTw+DiykqgquVXzjM2RtdpTC7R9383nHbfWJhaCcwlJsmlzga99lkkbpgr99/m+
	GmA3FlgslYOTr8Cl7Sdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOtCD-00EBmV-VQ; Sat, 11 Sep 2021 02:56:50 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOtC9-00EBlP-Dr
 for linux-arm-kernel@lists.infradead.org; Sat, 11 Sep 2021 02:56:46 +0000
Received: by mail-qk1-x735.google.com with SMTP id p4so4274112qki.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 10 Sep 2021 19:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=89y7dtYjpW2V9bTWN6kb0LJfhttVbVV+nnJbuimMLgY=;
 b=CA/aZXFeGkPuzg/ckeBhtNY8HYbXRlOYOhmLKCI2KF0rZ/NZcqyTRuwEd1PgrerdSC
 iGWWHM3lXyXIi0IWv0+n9JbNCwV+tCPZWA1HIZvPRSaJ3BI0+uTCum3FolNyCMFrOuKR
 4VWhE5avruEnXE9qopY1Q0NlrT81Pze+kDVNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=89y7dtYjpW2V9bTWN6kb0LJfhttVbVV+nnJbuimMLgY=;
 b=nh0JJ2Fy6L4wFitlo7oj96Xbx906xoLt1bYoyO4U9oSLGEYQyoX9JBvy7Wc/f1nWWy
 qnHKqrepLs4DmCIPf/3bCKPtMP+iXrNZIneQ3SgwzM5xarqDz6eN7RBrOjeWj3s5qDZM
 FM0s2S82922awm5rLm7uLo9D0nylPMV+aT8SgU94ZlnzdVLVi5TaHNvPVL2gWWcH+SXc
 HoKjwgcCGDHrqKITGYwKACa0MiDJG7CcrHZEiEyhuDBJp6vTvph/muU3dnY6QKxzPHYQ
 CbtGrMdHZU9RaEt/ZASuWa9wZaKFwnaOPhSf9ETzIM/4AhwUJBbQ/Z40sCjRTy8152Er
 hSAA==
X-Gm-Message-State: AOAM5319L1WfaFbStuOhVg+397dBjKaGEzN0qEVvT9IKqjS7gAZQ03dg
 LpCQ1y/MKecoYrmJALTjoQH/ZbPDxvv3HFk+mDPOKAPt4rA=
X-Google-Smtp-Source: ABdhPJxyPNstiWLJG53wPOjDbgm6Dv1LCOTIxLjonS9hoQA3Pq9DmrgpkpAr3oJe8ZeISaPvJyLJTY5o5JC47ysONNM=
X-Received: by 2002:a05:620a:4495:: with SMTP id
 x21mr498697qkp.378.1631329004367; 
 Fri, 10 Sep 2021 19:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-5-romain.perier@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Sep 2021 11:56:33 +0900
Message-ID: <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC
 maintainers
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_195645_551622_106D7FCC 
X-CRM114-Status: GOOD (  17.38  )
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
Message-ID: <20210911025633.pjXagSIKnRktvUFq3FZOzk7DaWlktUgXHO0pzS2yYsk@z>

Hi Romain,

On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
>
> As proposed by Daniel, I am going to help him to maintain the platform,
> so add myself as co-maintainer.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a9a7cbf9456..ad1a0e5a5425 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2231,6 +2231,7 @@ F:        arch/arm/mach-pxa/mioa701.c
>
>  ARM/MStar/Sigmastar Armv7 SoC support
>  M:     Daniel Palmer <daniel@thingy.jp>
> +M:     Romain Perier <romain.perier@gmail.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:     Maintained
>  W:     http://linux-chenxing.org/
> --
> 2.33.0
>

Acked-by: Daniel Palmer <daniel@thingy.jp>

For everyone else: For MStar/SigmaStar I have a ~350 commit backlog
that makes almost everything work on these machines.
It's impossible for me to finish up working out the hardware and clean
up and push patches without the whole process taking years.
Romain stepped up to help out and has been pulling out patches,
cleaning them up and pushing them. He deserves to be listed as a
maintainer.

Cheers,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
