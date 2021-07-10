Return-Path: <SRS0=Yq3b=MC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B372EC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 16:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 724A761184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 16:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 724A761184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkXjUm4rYRKZsp00XMu2q0tzl7Kh169IGC2eud9irnY=; b=jQY/BR0FoVZr+O
	zNP003h8eUV6AWF1wTdleyz/El89N6ZOMg+TNI68So5MrbcciBMGDxphQZjrID2lijfmt0EyMPEXg
	cCRAp9YztvoG8qIOdqlniL8007Gr6rvRqJXsdSFlToXG0zmnO+7S7gjUY0VnDruPA7KVOpUCCIx2w
	uKk2NWyMNdUdhPWAbdhDgGggPkOxxWrE2/r2Dy43HLEzyXRr+iR2yY/HvMHQiAw+5VGkChFEtQNwC
	Hq3FFFeI5d60ZGq8V5OqWVBmHkfEd3CBQ5uPmMG7rTEx1tdiv9YPIVloz23SqFHFrXF8v+kEChbFi
	J2CvL7llPjdhzesEAQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2G9I-003uAI-Qy; Sat, 10 Jul 2021 16:48:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2G9F-003u9p-4O
 for linux-arm-kernel@lists.infradead.org; Sat, 10 Jul 2021 16:48:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id n14so30590219lfu.8
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 10 Jul 2021 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UMwYm3Z5kzi/jKsZNKzSHFnOUpat3NrlV7AI13eBog0=;
 b=h1J+0nIt4sfDSPrqc3+zf1KmH1ZX/FyrDYTxSHYZF5cNvUWD5k8W0IacYSS/7Yp2Tw
 S7byUrDkJ2y8Pi727vaVaRBdIS7p16mRkrIZeUy2OcEJTZ++6E5T29c6GoFamaUUS4pQ
 ADhYcYMcoNqrSzQOTx3Mfd79GREJ8Quw1wzs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UMwYm3Z5kzi/jKsZNKzSHFnOUpat3NrlV7AI13eBog0=;
 b=OprbS6XUTQXjhg8dIbtQxE07z/qk1JESTCQmx48rYd5NG8IWr3f3kbV6u3moyjxE0p
 iNjuoSMOmkd45PN1Y9XvlCSMUeJnPeWVlSPUPO2tnCEBRFuM8Pey4n6QX/Bswhqn6qY7
 NRR/xhLDOE2rDMQJQGRZcFHMuLNzaW7ZSJNrPedUjAqCZ4XzrvayMSunrjJXGoY09g9D
 J3TiAKuJK+Tqfxv+58iPcq239gbhCZPOSz0zRMGjYrL1eqn+LcRzQ/tBUo91OrqgtQfB
 SG2XiL01BQDSjIukyiR9DLdCg+pchFu6lDfpekI7epKHfCQW3Uuhsy9WZOfGG/XKqowy
 T/zA==
X-Gm-Message-State: AOAM533nc4LSCYUsCVqLCdsmxdIkfgbMVtZtuYExqdI13D/Dbdk/pgHe
 0HoEIjV0HyZ2J9QousoCXim/VTJ8klX1qa29
X-Google-Smtp-Source: ABdhPJySfvbR3bbtEJmz+MG7z4Lceq3wSsRWsL/mAa0KEkUqn+t4PSBayqaPSg4pSZa2BQiFvxjA9g==
X-Received: by 2002:a19:dc16:: with SMTP id t22mr3818017lfg.105.1625935691320; 
 Sat, 10 Jul 2021 09:48:11 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id o6sm951627ljj.128.2021.07.10.09.48.10
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jul 2021 09:48:10 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id q18so30681267lfc.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 10 Jul 2021 09:48:10 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr32924003lfc.201.1625935690648; 
 Sat, 10 Jul 2021 09:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210709234054.10288-1-olof@lixom.net>
 <20210709234054.10288-3-olof@lixom.net>
In-Reply-To: <20210709234054.10288-3-olof@lixom.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 Jul 2021 09:47:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg3Pb1LxbXkTX6itxRvgaV9JwBaSyGmE8zXUurJ98M2Bg@mail.gmail.com>
Message-ID: <CAHk-=wg3Pb1LxbXkTX6itxRvgaV9JwBaSyGmE8zXUurJ98M2Bg@mail.gmail.com>
Subject: Re: [GIT PULL 3/4] ARM: Drivers for 5.14
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_094813_209594_F95C7A92 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210710164754.iaasnOWEqZyWG7RD58t-8Dj9rU7hHkOFOoZ_jq3cGQM@z>

On Fri, Jul 9, 2021 at 4:41 PM Olof Johansson <olof@lixom.net> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.14

Ahh. You had switched the diffstats between pulls 2 and 3.

            Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
