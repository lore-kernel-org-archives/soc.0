Return-Path: <SRS0=BbVa=HQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02494C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:53:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B7B64E4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4B7B64E4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVCq+aJ0UH4zmRAztoS+C3ufmyu09DlFjdcgw3OSygA=; b=Ya+PE6esIlE/43wCzd0f3i204a
	a823JcE69rzqKUXxMvg7euGWKyonpjfhfmJNZm1w+iuKKbHkyycWLlJF1n4RIrBh1O6oHhg+Yx5G5
	d4x8otdwS3hnvarwMJDxedBJy75X6eFFhC7D2djEL7smObpHtWSez+JlstCiGMdpP3DPoYo+VPo2T
	aRW/g8vCW5yge/IEyxROL6rd8VRkwv87nOsacIpNEw32L67GU691zG5WcnOWkOaRhtjXd86dE0ho6
	maavv6Qeukw0gXnAntYLMRcaz+v+RiApSaCvFkGeGP4mZXHs1cCk+4uoTGaRaxooOyzpLeQXro0mE
	SkVs9uQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBQG3-0000ie-4o; Sun, 14 Feb 2021 22:52:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBQG0-0000iD-Gj
 for linux-arm-kernel@lists.infradead.org; Sun, 14 Feb 2021 22:52:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BE1564E56
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 22:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613343167;
 bh=9c8uIGtBwhHMP6ynnak8KOMgUyv3JxvGHQXUn/ZjMwA=;
 h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
 b=s85/wyNl4MdGPnLABoECc2buwVBkH4miWdNaz5I84Gs5RL+947FqNAjE0mZqiS7Nb
 /tSybUKOEYRt0cX11IuKvgrKpQJHgkxjO2eJLhHXqkm9nmCE7UakKyBEF4FdIvxYCx
 J9K4moiKki5Rcw2xOpBJWZwr9YrYNmfPpru8dHMc941s5VNaskP+qWS6HqBJekCSqA
 K5l4K6KMWJ0a6wd+QT+Bwua4JgHwiUHAjEuEPjShRRtHI7MxBrKFXU826WGjT0RdAl
 a6/Pq47/thd4FzO7cJnYjApE+j9I9tRA+59gbiEPGGLpLaKWB4WwBpAnNbnTTuAIC/
 ehDhFtmia5J7A==
Received: by mail-ot1-f45.google.com with SMTP id b16so2119193otq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 14:52:47 -0800 (PST)
X-Gm-Message-State: AOAM533JIaOE8DslSk3e7r6YZHS+Fb2rjSIbvSq5/hNBJvSo3BKcx4c0
 lGhvEbUI6T8NQ8fSgaqNYcUV3nvsUBCpF85/s6I=
X-Google-Smtp-Source: ABdhPJyofJ4TKo29RyeBXDtMlejhQetcGvWOGcjJWOXjlwc5aa/j88POM+i/2IIeJXcfyWH3JKzFvdr1vx+5yKutVb0=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr9491439otb.305.1613343166842; 
 Sun, 14 Feb 2021 14:52:46 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
In-Reply-To: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:52:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zm-f6mWq=DiahdNcssGKwpFJN43Owm3kmC6VRkL0oew@mail.gmail.com>
Message-ID: <CAK8P3a0zm-f6mWq=DiahdNcssGKwpFJN43Owm3kmC6VRkL0oew@mail.gmail.com>
Subject: Re: [GIT PULL 6/6] ARM SoC changes for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_175248_711405_68238F92 
X-CRM114-Status: GOOD (  10.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210214225231.aa_LJsWvsfDGJSUBV4dDnV1AVlcU7jNVW0mUusBPsFE@z>

On Sun, Feb 14, 2021 at 11:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
> ----------------------------------------------------------------
> ARM: SoC drivers for v5.12

Obviously this should have been the subject line as well, not "SoC changes".

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
