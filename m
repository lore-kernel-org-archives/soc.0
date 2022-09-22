Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66268ECAAD8
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 18:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B4B8C433C1; Thu, 22 Sep 2022 18:14:01 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11A84C433D6
	for <soc@kernel.org>; Thu, 22 Sep 2022 18:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11A84C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-11eab59db71so15001684fac.11
        for <soc@kernel.org>; Thu, 22 Sep 2022 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dkVRxV4I7PRv0MPIkVzG//6n2SRR1vW4Iw6tfZvXO/Q=;
        b=FBOenVp5aH9X3CrUtLiquxr3kaSJbtIVoLUYfQ7rl6ER/kZflhaBvE6UcKAv/XzAKq
         +4V1KeJ4aRW0ixoTj0+nNnoM1P5NTQuQC74SGgKlbtCWcoHapIFa//0vox5YbieVbBH4
         j8Iqb5tNaEkW6g/9EhujwNlLr7pCOcOim5/NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dkVRxV4I7PRv0MPIkVzG//6n2SRR1vW4Iw6tfZvXO/Q=;
        b=Ir7TvynP6MQBREawzLxS5H9425F29WjTTdFjqw2XkqDlFzK7oFaJrh3D53GZaMVbSg
         u+B1peqHiaRYBy6ClJ/UO+7y5EfIOItFbgmCGVZ9/9qNCg1zF7/SOSwCV9cmcMEiAAD4
         SAMoAwE/ns59AZXMBoI+D9wMtwK8WZaQKgT1lup2E3uvn1ShbZDk5kQae++hmokCiKDk
         6ojvyRbVAGW+afEL2aTJjAPc4ibkpnebnOZMOr1u+w72uxpzbbP3VNmJ4CM3BIMyIuAO
         Zy4hS5T5wP5dTly2Aiu+fxTIh0fksyYpUnyj+q9NVnJ73kkTwK8hLGG0pbTuuJf2CyfB
         3K9g==
X-Gm-Message-State: ACrzQf1Ceax+lTOMLE7GjomngaFqBDun8PQ+EL9gWRwdYS98sODDJ/T0
	VqvfZGhVlhkGrtK4pRMGG0qBoeABiwBcoQ==
X-Google-Smtp-Source: AMsMyM5v9hcIPRdPyeT1K/NFbIPuMrrdYV7cjeKEUaki6FbCRhs5raaeQIR7d+7yXgvet6C6cmefaQ==
X-Received: by 2002:a05:6870:5704:b0:12a:f690:cac0 with SMTP id k4-20020a056870570400b0012af690cac0mr8966613oap.67.1663870438300;
        Thu, 22 Sep 2022 11:13:58 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id z7-20020a056870e30700b0012b2137fb3dsm3927327oad.40.2022.09.22.11.13.55
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:13:56 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id n124so13403306oih.7
        for <soc@kernel.org>; Thu, 22 Sep 2022 11:13:55 -0700 (PDT)
X-Received: by 2002:a05:6808:2012:b0:34f:ca73:ee55 with SMTP id
 q18-20020a056808201200b0034fca73ee55mr2388937oiw.229.1663870435647; Thu, 22
 Sep 2022 11:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com> <87427dd0-7307-57b2-4008-2ffb839a099a@gmail.com>
In-Reply-To: <87427dd0-7307-57b2-4008-2ffb839a099a@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Sep 2022 11:13:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiux9J6zi8sEHyLBVYc7zsWe6JwYOf7ggF+Oowc6fp4tQ@mail.gmail.com>
Message-ID: <CAHk-=wiux9J6zi8sEHyLBVYc7zsWe6JwYOf7ggF+Oowc6fp4tQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0-rc6
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 10:19 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> In case Linus has not had a chance to pull it just yet, could you amend
> it?

I did see this email, but as I expect to be AFK for the next few
hours, I took Arnd's pull request as-is.

I could pull your Broadcom fixes directly on top if you/Arnd would
prefer that as a solution?

              Linus
