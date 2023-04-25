Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D876C77B61
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 19:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 359BEC433EF; Tue, 25 Apr 2023 19:22:01 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2053C433D2
	for <soc@kernel.org>; Tue, 25 Apr 2023 19:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2053C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-506b8c6bc07so10440743a12.2
        for <soc@kernel.org>; Tue, 25 Apr 2023 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682450518; x=1685042518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRik1ba8P7vVGVJFKz6rQn6VBICPL/tBFMdSaau0t/M=;
        b=ej8Ewql86bp0QaJp9MK9EnfW5nmFTW57OCCTtSwzCApwx7xAwl3sKTtQN8Jsj6xvtC
         hFtaFtk9JXJj1VaJIcFGbgHKtBn/KzBjd0cGGxw91s+cuDZoSVEPC89v/3QZWSHAfr3L
         rWB5ZUTpctyR/cX6Ly2p4Qbd7ruoBlGcgERf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682450518; x=1685042518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRik1ba8P7vVGVJFKz6rQn6VBICPL/tBFMdSaau0t/M=;
        b=TJcNSJC97BbGh1k8stkhNcSQpk5kKL2ND4wIXzR+K8UG2UgBCMK6/5SF+Mzis+i+u2
         pSr7LwGk+Pf3LPvpHtMbYvM2/FbJuKIQzvPX019A+XrG7yfDU141eZxYpI1RRFNyPoKE
         fUD6X6M24cFKbhk+sC08Jdsy2X9W6BBRMNXd38eox73iCsAZl1ACutTPcmN6hmSgpiHm
         ib9ls9lJaYdL+uLuSZXdVCLkoPFTEnS3kcQtc6Iaifh7JmwoHXlGTWBIe4X48vAc9NvB
         X0gShtcPlWXidNc2PubQH1UU9xTOEoQZ2+3Nyw/yto0bxssXFHeR9ZPrz1Y+AFf+lMPf
         WRQA==
X-Gm-Message-State: AAQBX9ckFNfmXmZkLvQRiXgnweqNG8wHOgUbfUK0A7KitloKg9lqLTBt
	Z4g1n+MM3ae7Sq8l7nY/D4kBRbFyZrmTUfw5awahCA==
X-Google-Smtp-Source: AKy350Z2kZbjlyo8kogxPdo9pZiFLhktBEAlaDJ7iuM5ebO1/tmXxGLLXSQnQA2tB0NqgNr6dC8AyA==
X-Received: by 2002:aa7:d949:0:b0:506:bce0:48d6 with SMTP id l9-20020aa7d949000000b00506bce048d6mr14882136eds.5.1682450517839;
        Tue, 25 Apr 2023 12:21:57 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id n3-20020a056402514300b0050687ca0c92sm5947684edd.84.2023.04.25.12.21.56
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 12:21:56 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-506bfe81303so10458981a12.1
        for <soc@kernel.org>; Tue, 25 Apr 2023 12:21:56 -0700 (PDT)
X-Received: by 2002:aa7:dace:0:b0:4fb:78a0:eabe with SMTP id
 x14-20020aa7dace000000b004fb78a0eabemr15219963eds.14.1682450516259; Tue, 25
 Apr 2023 12:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <bbd25997-173e-4c3b-930c-65c6232908e3@app.fastmail.com> <3579080b-db88-493c-a260-7313a81e2aa3@app.fastmail.com>
In-Reply-To: <3579080b-db88-493c-a260-7313a81e2aa3@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Apr 2023 12:21:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMmTo=SL1URex5kQbhwGhfBy541tbNbLXrYniAnTxvew@mail.gmail.com>
Message-ID: <CAHk-=wgMmTo=SL1URex5kQbhwGhfBy541tbNbLXrYniAnTxvew@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] ARM: SoC devicetree changes for 6.4
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 2:06=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> ARM: SoC devicetree changes for 6.4

Hmm. This also has commit e49eabe3e13f ("pinctrl: qcom: Support
OUTPUT_ENABLE; deprecate INPUT_ENABLE") that doesn't seem to be
obviously about devicetree changes.

Whatever. I took the pull, but that change looked oddly out of place..

            Linus
