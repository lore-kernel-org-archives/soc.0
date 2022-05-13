Return-Path: <SRS0=kMA2=VV=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC83EC433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 12:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFE44C34117; Fri, 13 May 2022 12:12:19 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67962C34100;
	Fri, 13 May 2022 12:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67962C34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MbRXj-1oMt1j3R4z-00boIG; Fri, 13 May 2022 14:12:15 +0200
Received: by mail-yb1-f182.google.com with SMTP id v59so14926109ybi.12;
        Fri, 13 May 2022 05:12:14 -0700 (PDT)
X-Gm-Message-State: AOAM5307hYrGKDnjucx03ZAXIvRk5A98UOlMP/iMtU+WUZDYGXUh1foP
	CUmC/zzyWFsHWwFvnzGHbOeiROPaP5EeYMXRwp4=
X-Google-Smtp-Source: ABdhPJxfSXlHQiGp7nrwso72I/95P47eTph2XTKWx941GNdu4mVPGKCRC9whxXixu0RskwZlxcjV+W7Q9bXxryN7UkU=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr4509779ybx.472.1652443933446; Fri, 13
 May 2022 05:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
In-Reply-To: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 May 2022 14:11:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com>
Message-ID: <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com>
Subject: Re: [GIT PULL] arm: mediatek: DT updates for v5.19
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4zJjeeb/GTUawC3h+0/FnSud8sLRCd1DxqyF79rdqy4kAJSXvZR
 tBoSUdsPuQl09rY25MJMtmPg2WwrxoRkDNFC12Cbu73Bfn6nTcBaVi9/Q9upLTkQFG41vfQ
 dmILUzKVy9Xf1vP2MOfmIGsHolyS1T+SeF/FzgBmEtHDnlZn0rsV9JlZ5WBmNd7H9bzsxrd
 E8oeZLrTAhfbzdMrkCO1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hfnO9XevpwM=:8s0kzudaz60Lie0YjRcTTN
 9UptlzWPzswis7SceInv1F+9PcgrW1Xy0EVUnNVVmfRPghNqYPFRIvj2adGXY8Lhnvdx4sBfk
 hmTVXKUbMFgyOoknbnbjfDGuvnzilfbhPWSGMtk8hdRB0r2/CoumcEP2xYtwoaGULvv4jAdtX
 ZsDHc7BLVBZ9GAvx/AYPwxFW5jL896K09BwZCx+CoLH6yEYHPu2CvdLRFc+bCOk0jicSb9QYC
 2whPfgACzruMcs3uxoxsR0UrePEnNvowih0uoLSHJqZILrkbY+ir67uwTHG9Yg6/gLCIPqPwR
 SRZIDDqq6ibyPyfz7mMUzmaHMi7MJ7L4hsTMj8YQtcLaDkQ7yZ7L1HXdz2UB3l57yjHEUvZES
 cCu9AK0hjTQfdd0pKpIj2vHgLdfbqymEeq8Gbt8bKTcNVtuY4LKwreWcQGOzWYxaQySaQQ9F0
 /aLVKp4YVgjUpi4DHpRS1KUJk2o8/H4FYqCsZ+1PeibdDLxYe3PeQ7UHxLEVsNW+qv5L7IpWN
 Cfd4O4tbGk+PAHCysC9R54K/Q3d+m4n+bjsbmmL4d8PAArcWOg8ZRPOsJ1KbAIV+Aq8anD1qP
 dGYn3EWB2465go8E5B03so+3GAscjeL6hJOaJW5S+GPZ76TacPJ1BWF4+zmlfFthP+x+dppyH
 UmVFLReu/FkJSfyDUlzXbKZHPueaP760t38W0S5q2BzZejrI+SDZs7VMFMyRnI0tXe1THhWd+
 KbeAMhRDAKtgcW+LAsbQLOb4lhYNiZ+G+UHBogajtq7W9iUDssx7Xyx0kyzwX0YLwNFaxnzLK
 GO0/lyVqucq0D/SQGpPGFCylLnLSwzNlhIFXM+S2pziEPPz+UY=

On Fri, May 13, 2022 at 1:21 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Arnd and Olof,
>
> Please have a look on the below 32 bit DT updates for v5.19. Apologies for the
> late pull request but I got sick and needed my time to recover.

> Yong Wu (1):
>        arm: dts: mediatek: Get rid of mediatek, larb for MM nodes

Can you clarify what this means for backwards compatibility? I see old kernels
used to parse these properties, does that mean that the updated DT is no
longer compatible with them?

If you break compatibility, this should only be done for exceptional reasons,
and explain the tradeoffs. What is the oldest kernel that is still compatible
with the updated DT files, and why can't we just keep the properties around?

       Arnd
