Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793EDC64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 14:01:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF4420857
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 14:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4bi8YOD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI7nVeKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF4420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BxmAuLu5jb78cABIJoe4s/GZd8Z1HKI0s/GrFHYpx6E=; b=n4bi8YOD9iLw0d3a8Akx4er12
	5Ow+cTDQ63O2wG8OtlL6GfBAEsXAwGAZL+Y2j5EuKGCWglzJxNspVD6jZ3Edr0OLVJSHRJyGbzXZh
	R/0YEdkwIVZ6UW7aLNu4tKUgZCsJ7a30kF6ZINU0MOiKRxU6XQni4c4o6e318IHHRR56vAvBf6l4w
	3uzy+nQSiuxuQixZ03aVz3P3XCrJ8Z9SZGMJhsSxCPz1h93QD/r13nt/rAyxg2mgNSdHum1KFnV1f
	VVlF+Z83x5C+D9yTE6ogcgbCbFBcCqid7qUrxKKq5QF5wsRljyyyIQ4FvIcJ2zGVafoNoJfcBxtlE
	NkMP5WA2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk6Cp-0003hR-3p; Tue, 01 Dec 2020 14:00:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk6Cm-0003go-W9
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 14:00:33 +0000
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BDBD206A5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  1 Dec 2020 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606831231;
 bh=O62Ley1kLgnTGTTtBIkFeZkMguvT9Z/11bFZt3zB93E=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=kI7nVeKljT/HagHl8ZBEIAbG1WKI8mRkrxQdrGPzx5kt8b6xQX07CQJ+dNvYpQ3CN
 tUQDIIXVPRs3F9KmYgrHoDKjkocdyIzq/jMa6KtEnfDQSHB7XrUiExdKF4qTLf3f7M
 U5gunmNPpQy8TqwVK3zUHkLAc6hKs7mCr0pBb9lM=
Received: by mail-ot1-f43.google.com with SMTP id f12so1679260oto.10
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 06:00:31 -0800 (PST)
X-Gm-Message-State: AOAM533h4WgadeyeqfJWMW2TeHiEXNjw0DGc7uuaWICBz8PqNK9LIubk
 HflX7zT9CUXokbMis2UZTUD0D/+qTnXHzmiqKgw=
X-Google-Smtp-Source: ABdhPJyWPnX9nI4ha3PJDswUnA6kjjA6J59qgRIPH68lp4Fm8BI3J6i4bXD0oi3uahD826C21DnBK2AVDKYdpBCjlrc=
X-Received: by 2002:a05:6830:22d2:: with SMTP id
 q18mr1731360otc.305.1606831230265; 
 Tue, 01 Dec 2020 06:00:30 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
 <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
In-Reply-To: <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Dec 2020 15:00:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
Message-ID: <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_090033_168955_9858B952 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201140013.S8C36Kp4nXI9JbsI4EtYbROFHThG-Vzq-CsdHsxxEmM@z>

On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> So, I think we have two options. If people are willing to move to
> "disk labels" or to patch their DTBs with mmc aliases, things can stay
> as is. Otherwise, we can revert the async probe parts of the mmc host
> drivers, but that would still leave us in a fragile situation.

Can you reliably detect whether the mmc aliases in the dt exist?
If that's possible, maybe the async flag could be masked out to only have
an effect when the device number is known.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
