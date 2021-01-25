Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B01C433E0
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 09:31:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C360822CA2; Mon, 25 Jan 2021 09:31:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 954DB224DE
	for <soc@kernel.org>; Mon, 25 Jan 2021 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611567066;
	bh=rW9tB3Y9d9g46Nfv/+CMa2d+g7a7cqYRMyipw9C9Jpo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tZzu8JTqt037RLZkl5R5m19yXmrfMgV5kB92OzdqkE/aS30tbANNQTHFSH9wRvlip
	 GgjouewKOaBNH05ihM+4GCx7eENHdwFAcgSnlTWrrFTVZTf351dxNoqmZMGZe4jk7e
	 QXyG3gEElNEBO5Dk42uf9jpa0i7hjJ+Dpcek65rE7cIhnb2FJe4VHGvVgCX7khpggG
	 MykOYp3M9k7Dfc0K7McBe3lqP8+7vl1ozWf9PQAOMSj/CdgJhDm/58rUW48y/3XcQ/
	 mz0DId0FUw7JGKx+w41Sa1StREF4cXO+mNfrXc01SIbrSB7vr60Cg8FK1aeI4r9QOH
	 0wEi8QM//x4mQ==
Received: by mail-oi1-f179.google.com with SMTP id h192so14119790oib.1
        for <soc@kernel.org>; Mon, 25 Jan 2021 01:31:06 -0800 (PST)
X-Gm-Message-State: AOAM533avBhYM0U3hl0E7+Zs/Muz2UWeKakbLQ5jiYsZd2isEmEZ7IMn
	GFZmf4DVk8TcNIJYUH57gjLyc5I8XK95Sbpta9c=
X-Google-Smtp-Source: ABdhPJyCjz1/4f15gv8ZYU/WeopSEO/SAx+IH2rpRcbJP0DwJXk1BbPhUuMdNOFffGNZQWLsIANPnTPsMnNP7FmDGNQ=
X-Received: by 2002:aca:be54:: with SMTP id o81mr590021oif.67.1611567065873;
 Mon, 25 Jan 2021 01:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20210122074234.GA1074747@jade> <161135641124.29035.6761157228532077144.git-patchwork-notify@kernel.org>
 <CAHUa44HCnzgYndTccs=SSb1BQ9nk05k8vUQ-TO6Z2ZukwQcUPA@mail.gmail.com>
In-Reply-To: <CAHUa44HCnzgYndTccs=SSb1BQ9nk05k8vUQ-TO6Z2ZukwQcUPA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Jan 2021 10:30:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3gbLPsSz1c95ExBqnZ=y-4p=b9awpDQjVSEXXUTr13LQ@mail.gmail.com>
Message-ID: <CAK8P3a3gbLPsSz1c95ExBqnZ=y-4p=b9awpDQjVSEXXUTr13LQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE driver fix for v5.11
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 25, 2021 at 8:21 AM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Was this merged by mistake? You had some concerns about the need_resched() test.
>

Indeed, thanks for noticing!

Could you send a fixup to remove the need_resched() check after verifying that
it works? Alternatively I can remove the patch I merged by accident and send
my next pull request without it, but I'd prefer to avoid rebasing the fixes I
merged later.

       Arnd
