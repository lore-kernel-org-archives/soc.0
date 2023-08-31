Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A7C83F01
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 00:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25462C433C8; Thu, 31 Aug 2023 00:08:23 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94735C433CB
	for <soc@kernel.org>; Thu, 31 Aug 2023 00:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94735C433CB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4c0so468830a12.0
        for <soc@kernel.org>; Wed, 30 Aug 2023 17:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693440499; x=1694045299; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/HSUbvCmjvUYxW13fpTOiENotuRhulbUWAS63hgfbqw=;
        b=SWf0f5E8e9mZ7MiIhnnsu3uIPXs62PtOad5UruJyBtYBMJD7GWPw/9q0sBMXInWWAY
         bJsBb3svs7lyki7mW1nqZ80JTpVTxPkcI3cnb5bLP9qhZ+x9Kd79rOubRYZWYcWbjEdi
         z7Wg9Te/ug0Ft7ZFVox8BnZllR6SAWfW1hTpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693440499; x=1694045299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HSUbvCmjvUYxW13fpTOiENotuRhulbUWAS63hgfbqw=;
        b=BQoSq/BztOLIRBK+EKwYQpO6Tjdd6OwSEYtjDd/UT79tovbx1kQHdSAgSMoG/8suhn
         xbSMfKpHFldqqv977MMVBmwUohde2PGq3ha+OjMVeCc6S6M10QvD3fsUEFholqt583qJ
         QwoHrIr7PxMwyLinoT46RvqPufjHDFh/NBYedfSVtMEUxPvPhOzmgIhyn0AdvWTAlCTm
         6Fk5WaH5Zri9m0mtSnjSFVQkbZbjtckYrdmBVhI2lW8qOxjsPP7z3dZ7eaQWgeJixKCG
         c377j/PEosOGQdH6Wc9kqXPMb5QYAoBwfSolH8/ZbXyrkH/ntmEAJNDJBNeHYXzeThia
         rFSA==
X-Gm-Message-State: AOJu0YwuteX38m6gnpszsZdb0aytsIA5BCdzBJ6YIIL+UlIEOvEZIlNc
	Cpnc2Z+jIle3mYXmWtNrc52hJLVWdqrQ5SgWnHuApQ==
X-Google-Smtp-Source: AGHT+IEFNgop5PXO2p8kxgzYUORf7Jp3K+36P+5FFfMQZhtyfYnpmBEDFVYH8BgScqy2XczidQ/YhA==
X-Received: by 2002:a05:6402:35cd:b0:51f:ef58:da87 with SMTP id z13-20020a05640235cd00b0051fef58da87mr1628080edc.2.1693440499019;
        Wed, 30 Aug 2023 17:08:19 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7c58a000000b005227e53cec2sm154474edq.50.2023.08.30.17.08.18
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 17:08:18 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so46861666b.0
        for <soc@kernel.org>; Wed, 30 Aug 2023 17:08:18 -0700 (PDT)
X-Received: by 2002:a17:907:7799:b0:9a5:cc2b:50e5 with SMTP id
 ky25-20020a170907779900b009a5cc2b50e5mr1382530ejc.32.1693440498078; Wed, 30
 Aug 2023 17:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com> <CAHk-=wj1j0HuNWKLEzi74zEr2rGnMLEFZjLvV=rzdqzQPqOzdQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj1j0HuNWKLEzi74zEr2rGnMLEFZjLvV=rzdqzQPqOzdQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Aug 2023 17:08:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=whpfnSqToqx9f7G4-QssDHW2TBPqiXc5q1=q7w9NKxiSg@mail.gmail.com>
Message-ID: <CAHk-=whpfnSqToqx9f7G4-QssDHW2TBPqiXc5q1=q7w9NKxiSg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Aug 2023 at 08:07, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Aug 2023 at 01:34, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > Please advise me on how to move forward.
>
> Just to not cause pain during the merge window, I think I'll take the
> current trees (eventually - I still have other things pending first),

I took the existing pull requests since they were next in my pile.

But I hope we can get the naming sorted out still during this merge
window and not leave it pending for some later time.

               Linus
