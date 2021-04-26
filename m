Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8263C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDC861178
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDC861178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ChVCV9wjxSFJJvIPiE1RfrUJO8HloEqnmZfwkB5APQ=; b=kp7W7GGv1MbCobiJvoy0o6k+d
	I6aG0LsnmXr/w/fyszdZCwWcKJNYn7f6xNHg4kRHx9+rHlayQ3unXci/9+SMLVQNTgcZBuCyJeQrG
	S/D6NpyuzmJdxzK+B7KlYz4ToXxwzXjk+tW3jiMXRtnUgyu0tsiD2L1INeTqoOplqeD6dkt4nF/qy
	+ftAThqXHCkme+Eu6pWIdX86ZtHvLy4SlyzbIEnURPSjFxFqqYRIODbuHx5g5ucSUUAk2+Y9S5uTh
	XPUde+v4RcZlM179b70+OC4DZ2DuVI25CHra95r7JPqXoHvJnbXONxfpZm0IY4ZUxme0xaxjARYgX
	do272qTtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb75p-008P1s-KA; Mon, 26 Apr 2021 19:40:29 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb75k-008P1S-8I
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 19:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TLJVtvvBoq/yqMsEsQp2CVsNqoS4kEVzTchedKnBltY=; b=d3aXGsOvj1szO7z8fQYgvPU/3G
 FDVdA636ALxlRsWQCebSURFUihEb6kI23FkqgH54rv9Z1NS4mRqX/Xvs03N85DJCcfadK6viX4dZw
 Km9kspRKISlXgpFdE3L9U0YTnzMt9cYEiLi6h6mVMsx6MBuaqVYuTILZbnMPjthccJJVN2cmmIj3S
 9+Yd6Rtxwnrhrtd6GXrYRaoK3Qjkq0e6KirCSlP9QSEoezFE/SC0ToVJVZXUZnEvAl7N/n096ri5n
 uMbx8A7ez9bF0yHzKDZg0y6ek68TSnl+w/zsD7bRuZTADQdyrugAFVVt4Nzt92O9hh5VUcOcevdAN
 0fpueyAQ==;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb75g-00G9Ms-Gw
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 19:40:21 +0000
Received: by mail-lf1-f46.google.com with SMTP id j4so50551618lfp.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TLJVtvvBoq/yqMsEsQp2CVsNqoS4kEVzTchedKnBltY=;
 b=NxuUruDr2lHnywJ3Z+r1UAHxMhgCb3UXfYiRrhPJNqo/FGK2U0yh4/vlZZ85hcv7nA
 3HvU6GlJWZRop3dtZzBjGWObyYxvKgpbeCBjOIoUeouS04fHBeKbz6C8bj89JWN2R32/
 AsOVH7NQyCezbLTnpC+iiKrKnd9al2JuP18Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLJVtvvBoq/yqMsEsQp2CVsNqoS4kEVzTchedKnBltY=;
 b=fLmQLhcvnRK243XzIH8TyteYJdty9b9um+/41Xwd4tK6l6qxAR03A4AsfFhCYEaeaG
 DKnWub+ULUu8FNi2i2V49qzCzXzs/1H5RkJ4SW6UKiuTuUUHcztJZUx4ChGNiPDj36sl
 TiCNpm0oYbVBECdbGWg5/IB3uv1gmCGWVTNN3KVG63uPhl4+tp+ZgUF44Ecb6SoQZFpa
 4h7rCvJK5E0xUEAo/QRoI4C8WgbC50NuVcY8wpEs5uNoALhlPMNabqEc4E+u56omZP4J
 ArqF9vMFO2c18rSBuPz9N6LNl52kh3fxb+5ReJQ3RxcNa/Xt5NVqenXdqIIDvnHyPPcM
 U2iw==
X-Gm-Message-State: AOAM530ib/wdi0vFmzix5HMo6yMyjEUo5O7nuSzfFeIt4d8XwXwarnnr
 2fiKxRQJ37rWWtPXRUOfUPa0fv/0IWco/mP2
X-Google-Smtp-Source: ABdhPJwi41MSvFEmExMfneyExOoJu63yrG657fUk7slQqPyZFYksP88h62Al6wCBKaWBf1Y2+M3bSw==
X-Received: by 2002:ac2:55ba:: with SMTP id y26mr13706864lfg.590.1619465958137; 
 Mon, 26 Apr 2021 12:39:18 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id e11sm101967ljj.59.2021.04.26.12.39.17
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id m7so54676115ljp.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
X-Received: by 2002:a2e:1406:: with SMTP id u6mr13608357ljd.61.1619465957464; 
 Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Apr 2021 12:39:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
Message-ID: <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] ARM SoC branches for 5.13
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_124020_751481_C99D9FD9 
X-CRM114-Status: GOOD (  11.36  )
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
Message-ID: <20210426193901.QTuyBjAxejcs0nvtm2A1J5oIdpnmTQmjYg7HORzgS6g@z>

On Mon, Apr 26, 2021 at 8:53 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Here are six branches for the SoC tree [...]

Ok, all merged. Please do check my conflict resolutions - not because
I think there is anything wrong there, but simply because the arm side
doesn't get the same build coverage testing when I merge.

All but the two first had some fairly trivial conflicts with the other
trees I've been merging today.

              Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
