Return-Path: <SRS0=HsGY=7N=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B78C74A5B
	for <soc@archiver.kernel.org>; Tue, 21 Mar 2023 08:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF835C4339B; Tue, 21 Mar 2023 08:33:33 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72823C433D2
	for <soc@kernel.org>; Tue, 21 Mar 2023 08:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72823C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5418d54d77bso267464947b3.12
        for <soc@kernel.org>; Tue, 21 Mar 2023 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1679387611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KB6vuc81jSSkKnMxrZTvHvPKSRtY1MligJPcYjgonTw=;
        b=L854542Of25QQ3JVGYZn6a0AB9OOdy/B3vOuhkEK5OAKN4+xODvce3FBD1g8PSV1nD
         PqyMVQ8WlCcy63cRosAHpzwvRh3bckIgDVOVhlRww5TSKtt4WgapFm5Y9wgl41WSVTAd
         620aYogY8pRdmc8ttv103/JZ3il6bJWNu6kWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679387611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KB6vuc81jSSkKnMxrZTvHvPKSRtY1MligJPcYjgonTw=;
        b=lzWzKBSxLrCktnFq90FbNr+ulbPIJdccYk3OE6l/sYLCnAMkwK+FEQRz6YcnL3tIm8
         6VttvWL3LnEhm5zRV7LcpM+3rrct9I2R96xPLE/ue/sj4e84/hnsB40hVTcXF/5ZxJQ9
         aHirKvotbFTJuvDY2bbWaDGQxV0nVPsTBYwHfS7tPeyPYIpDE8a4HO8F9nbxaIdAczQO
         VYQV9WB/Q5CEYpuKxA6NT219NWAvNoeZlvsX2Pj/s+TUSfLOzk+U6M5iUfGF7x27jOQt
         V5jHPRxuPyX95hsFVv6BcNRVxEYSpkjb6fue7xgqNZLhG1WVnloqAhQ+1AtuKTqIQ2Pk
         yP3w==
X-Gm-Message-State: AAQBX9cHyhlTfPfcOnmCAij42oFH2m2hMYq5jVTAprWBs+U9zVEZ8X/u
	LOvXRAICZh+tebG8ph8sLOyXRFHG6Ay8m9N841iNsQ==
X-Google-Smtp-Source: AKy350ayh3kL/5wMU+1FJfsQfBzUOLJnlM6KS2hGz9x37v9qA1HJCUgNxeaBqW+vqDU/KvLwNjxHef4Xv3FGx8lBXeY=
X-Received: by 2002:a81:af50:0:b0:541:85d2:af21 with SMTP id
 x16-20020a81af50000000b0054185d2af21mr582975ywj.5.1679387609813; Tue, 21 Mar
 2023 01:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 21 Mar 2023 17:33:19 +0900
Message-ID: <CAFr9PXmKsequA3V7QWC2fKQYZgaNRj+q3q=UOBLmg6wxYKiVYg@mail.gmail.com>
Subject: Re: [PATCH] ARM: mstar: remove unused config MACH_MERCURY
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Romain Perier <romain.perier@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lukas

On Tue, 21 Mar 2023 at 12:38, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7
> SoCs") adds the config MACH_INFINITY and MACH_MERCURY. The MACH_INFINITY
> config is used in the gpio-msc313 driver, but the MACH_MERCURY config is
> never used to configure anything in the kernel tree.
>
> Remove the unused config MACH_MERCURY.

Because work is still on going to push that stuff.

nak from me.

Thanks,

Daniel
