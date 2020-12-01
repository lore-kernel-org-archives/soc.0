Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE98C83017
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 14:00:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D77921D46; Tue,  1 Dec 2020 14:00:31 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 16A7E217A0
	for <soc@kernel.org>; Tue,  1 Dec 2020 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606831231;
	bh=O62Ley1kLgnTGTTtBIkFeZkMguvT9Z/11bFZt3zB93E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kI7nVeKljT/HagHl8ZBEIAbG1WKI8mRkrxQdrGPzx5kt8b6xQX07CQJ+dNvYpQ3CN
	 tUQDIIXVPRs3F9KmYgrHoDKjkocdyIzq/jMa6KtEnfDQSHB7XrUiExdKF4qTLf3f7M
	 U5gunmNPpQy8TqwVK3zUHkLAc6hKs7mCr0pBb9lM=
Received: by mail-ot1-f41.google.com with SMTP id 79so1688037otc.7
        for <soc@kernel.org>; Tue, 01 Dec 2020 06:00:31 -0800 (PST)
X-Gm-Message-State: AOAM532wQQ/45dS72G2mpBIl62E/B5SszlhMOHSEotfU0eqoB79pbupm
	XugShJ6frgyul5JVnOslZQizdp8TpwEZx+vlVKA=
X-Google-Smtp-Source: ABdhPJyWPnX9nI4ha3PJDswUnA6kjjA6J59qgRIPH68lp4Fm8BI3J6i4bXD0oi3uahD826C21DnBK2AVDKYdpBCjlrc=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr1731360otc.305.1606831230265;
 Tue, 01 Dec 2020 06:00:30 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com> <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
In-Reply-To: <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Dec 2020 15:00:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
Message-ID: <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Doug Anderson <dianders@chromium.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

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
