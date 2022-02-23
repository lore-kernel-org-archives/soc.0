Return-Path: <SRS0=qq9I=TG=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C025C433F5
	for <soc@archiver.kernel.org>; Wed, 23 Feb 2022 09:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5381CC340F1; Wed, 23 Feb 2022 09:47:54 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5734C340EC
	for <soc@kernel.org>; Wed, 23 Feb 2022 09:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5734C340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id x62so4132752vkg.6
        for <soc@kernel.org>; Wed, 23 Feb 2022 01:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qMECgKMnAeJCt5deSyf/RWgwDprSNTJG/bLQ+2c8x/s=;
        b=W16BFV+yPoxC7oosWCJnGIE6zE2NhbQ5rH8ubdnBX1QYMr3AabCQkm5TNU58ACZzru
         1DJg81cLRBwuVi8Zo+jQ+ZjgvnnM55mIcNuiiSKqFKPmuugYU6uQvh1InJkSfuEChAco
         h8ITvXMpluM2nydVBUXuUkyQFbJPUyrTPc/fIbt8XRxwEnmnqUsIFSvBLO0ww3mPOVde
         DwnZ1bBTJ0hp3cHAqetZUTAIIAEyfQd5u9TRo6mkiOgjg8CVSG8wcJdAq79GcnyvIXLM
         rPkh9zMIVG5CakL0MWWEnWOYW+npsFm4SIIFNsAbLQcwGb3nAYJHxdgJJH3Dxt8wGh3A
         jD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qMECgKMnAeJCt5deSyf/RWgwDprSNTJG/bLQ+2c8x/s=;
        b=3Agne8Rm007TmL9wCtqmZ2a2mBWKoVRLLU6FbIVNK1iT7f7qKOelu5HzHgPlVecQpu
         xIG8vMw8PCAb4SGUKaapmWusOcxALxnMmBr3SHhwoKM2Pdai0n+mr+GSFTc+sCO3pCcs
         sL5j8oiWibMOXJI9zKK3g7PrTBZrDfw2XQFxzYHr0JwdCHT1YOV7GGpm9nSybNsknf7N
         ETrANbxsyRmqyeurE4Hf84Wbo9Nf8djRqVoHf2HmaDxQqxepBADWESDMd38GCS8PtdI/
         ppBLcghAL4xJfmtALEdJLUgxrkvNlH/4yVTuXjJ8oA6tnircqFmJmqVxUR92yqxxnK8q
         oX+w==
X-Gm-Message-State: AOAM532dSZCDv2EF4sSGd7OPoCwhMKp0+fhMIIBp0zAKiZK3LdjAecDj
	VgX65PIa4QD541bBF3wlkrb/bvh0ODx8dgSHi/E=
X-Google-Smtp-Source: ABdhPJxY3c10KObUfirZ0ArvlzSlRI9T5EqzLO2vj/PVnlD+24tG0PNw6xlCNqxvvBtxH0pI3R+ZGGeE6bqD7ORTGnw=
X-Received: by 2002:a05:6122:788:b0:331:2063:3645 with SMTP id
 k8-20020a056122078800b0033120633645mr12421979vkr.10.1645609672679; Wed, 23
 Feb 2022 01:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20220223064807.261878-1-daniel@0x0f.com>
In-Reply-To: <20220223064807.261878-1-daniel@0x0f.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Wed, 23 Feb 2022 10:47:42 +0100
Message-ID: <CABgxDo+uF9pQ=sy7FEJ4WiYNpS3St9u3xDMt8MZNZXQF4kXSMg@mail.gmail.com>
Subject: Re: [PATCH] ARM: mstar: Select ARM_ERRATA_814220
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mer. 23 f=C3=A9vr. 2022 =C3=A0 07:48, Daniel Palmer <daniel@0x0f.com> a =
=C3=A9crit :
>
> All of the SoCs that are supported so far are Cortex A7 r0p5.
> So it seems like this errata is present.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Romain Perier <romain.perier@gmail.com>

Regards,
Romain
