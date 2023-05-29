Return-Path: <SRS0=syZG=BS=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81425C77B7E
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 22:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4876DC433EF; Mon, 29 May 2023 22:50:29 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38503C433D2;
	Mon, 29 May 2023 22:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38503C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6261a61b38cso9328506d6.1;
        Mon, 29 May 2023 15:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685400627; x=1687992627;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVBRt1RRCrWOt+dpsuJxOTx1nUGJsRbKUrCzrpzPHpg=;
        b=SnClQBMxTp7WB5BKdPH6jLBMnPf5Rr57XQye4Tg/qNfGeWa1n6+0eqOQcuMaP2RptJ
         7TKbm0BI28LC/0aa5r1aTz7ACKqd03WMuYRX6Gdh3fOUwo58EzWofQlfs1C/Nsymc6YB
         c6FljdFLU6htyUlDU3cDgXZaLY05vZ2PZLXLCXkkWZpYX51iOFbdmkV93z4kUlZTd7sv
         okUF6FFd5LQd75En8avR1si/y/Ot4/tgWQHudIRv2wpc7DH8fsrRQFyEqD60JD6Yila4
         ccE8kSERvSJJMZ2sN3sE9j47sTHDrPii5Lf2dGarVCJ3pEedbfuznbV+u2p6ed46QE8e
         /q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685400627; x=1687992627;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RVBRt1RRCrWOt+dpsuJxOTx1nUGJsRbKUrCzrpzPHpg=;
        b=NAkH83Va7dgjEOiFm8IlXnSgtfSjVp/kPXHtGFlOrDFFU6fT5N2Ee9cZeLCnJLsHry
         PwC7BmywkFb8TQ8pcYvOJOJIzWmSSmz2iDD4wKXA57mCwfnvGzCAY/LqTMpVWC1MDWVy
         NRv7EfF3bCJViVb8ONwzKUleJij5JW74mSCGQAP/Fvm4/85SGSTqUEEhlic5WJEz2WKV
         5fZ80wMGqTjs7Rd7XYkvLmKjgr2n/iBJ44c654/i3a6J7Gs9/cMA9mLj6KCGSBB3T5fj
         M6Oycyq1UOwL6JamOGM9IJ+pIjhO4d1bSltslQsAaXI7MUGZp2UgkeQfJSTnmdWhaXIb
         Mo1Q==
X-Gm-Message-State: AC+VfDzDBeH6ApS+RQDtD7rtI3ZgUjH6ibXkclYWQbOcrgNaIBgyDpbC
	xwZMOYmc+0XuCEwk5ZASRM3wFZjkoSC2mA==
X-Google-Smtp-Source: ACHHUZ5RCCEHDMQYUZGVjcK+yOtF4rKDjrLpwjulFacPlB4NJo4QrqTLdOvIxYIYnMkqqrmoK4HEKg==
X-Received: by 2002:a05:6214:c24:b0:625:aa1a:937f with SMTP id a4-20020a0562140c2400b00625aa1a937fmr186250qvd.59.1685400626774;
        Mon, 29 May 2023 15:50:26 -0700 (PDT)
Received: from localhost ([2600:4040:2007:9800:1794:1f51:786e:6197])
        by smtp.gmail.com with ESMTPSA id p8-20020a0cfd88000000b0062439f05b87sm4121831qvr.45.2023.05.29.15.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 15:50:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 May 2023 18:50:25 -0400
Message-Id: <CSZ4NQFL3URD.I9QE8Q3018KI@Latitude-E6420>
List-Id: <soc.lore.kernel.org>
Cc: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Olof Johansson"
 <olof@lixom.net>, <soc@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy
 Express
From: "Rudraksha Gupta" <guptarud@gmail.com>
To: "Conor Dooley" <conor@kernel.org>
X-Mailer: aerc 0.8.2
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
 <20230528-decode-creasing-f5b3996163e5@spud>
 <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
 <a8d3d68d-d202-ddba-3289-65b347807538@linaro.org>
 <CSZ46N3I9GM7.NON5KMJ66OK5@Latitude-E6420>
 <20230529-bonsai-during-37a47a528ff3@spud>
In-Reply-To: <20230529-bonsai-during-37a47a528ff3@spud>

On Mon May 29, 2023 at 6:37 PM EDT, Conor Dooley wrote:
> On Mon, May 29, 2023 at 06:28:05PM -0400, Rudraksha Gupta wrote:
>
> > Gotcha, I will do that next time. Should I still send v2 in a separate
> > thread?
>
> That'd then be either [PATCH v3], or [RESEND PATCH v2]. Ideally v3 since
> you will have added the tags you received on v2.
> AFAIK Bjorn uses b4, which should be able to deal with the series as-is,
> but sending a v3 with the Acks etc would not be a bad idea. You
> should probably give it a couple days before doing that to see if it
> gets picked up before doing that.
>
> > Not sure if I should as I don't want to spam anyone.
>
> Sending new revisions of patches as a new thread is not spamming, we
> signed up to be maintainers, or get to email from the lists, after all.
> Sending several revisions of the same patches in a day would be spamming
> though, but that is not what we are talking about here ;)
>
> Cheers,
> Conor.

Ah, I see. Thank you for being patient with me. I'm really excited to see m=
y
patch go in! :)
