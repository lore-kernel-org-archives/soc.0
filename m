Return-Path: <SRS0=TwaW=JS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E89C433ED
	for <soc@archiver.kernel.org>; Wed, 21 Apr 2021 06:32:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB1F461420; Wed, 21 Apr 2021 06:32:29 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 074D0613DC;
	Wed, 21 Apr 2021 06:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 074D0613DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MNLZc-1lAJBh1XK6-00Oonj; Wed, 21 Apr 2021 08:32:27 +0200
Received: by mail-wr1-f46.google.com with SMTP id e7so31092237wrs.11;
        Tue, 20 Apr 2021 23:32:27 -0700 (PDT)
X-Gm-Message-State: AOAM5302pHvixahHSdgpR3FQw0JvDdL5rAIOvzXrjGGlX5pttyNocKfh
	MISmX+peOqG1iM8k4rhrCmKSJYE3GK6sO8lhE1g=
X-Google-Smtp-Source: ABdhPJz8KQSQMuG/h3FrLd/30pB27ABNbzxI+tJP3O1/oI7h1c5S/4lxz8O5iRBe9dLjnXhf6FKlZ1EzgS+Z6bRkkoQ=
X-Received: by 2002:adf:e483:: with SMTP id i3mr25900890wrm.286.1618986747076;
 Tue, 20 Apr 2021 23:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210420230402.8807-1-khilman@baylibre.com>
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 21 Apr 2021 08:32:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2bJL732XttLnjRH_1TA3EpuVaPyBDD0NbhbCO0WmqcNw@mail.gmail.com>
Message-ID: <CAK8P3a2bJL732XttLnjRH_1TA3EpuVaPyBDD0NbhbCO0WmqcNw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8kCZfFlFrqohrA8Flzt4KPavmg/t6o8MqIoR4Uv9KsXWPYaXFrn
 JrLkttsRsLrlrp8OgyWbZmfPwSFehhoij9J6OExUhjdYjN+Q0QLeNUqqshNhO+MIPBWtmCQ
 5p3yHvglRBV7/RXWuRtDgkhTjZ9TayP8R7NzTK/2Py/Px6onIL+WV7tr5SgAdgaIYJSeBkE
 2jzWOCYshGTuNw1iTv7nA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fvA5m9mFBrI=:p63oPuZjtrXJWz7cLY36n2
 O/yt+w+0g7neHt7wOiX9AG13j7zJGxFzrwQS0/XLY5YzxOR4FTluK9t1gZ4/IMVGmVlIhRuTG
 IQ3cYo0d54A+YRxW2IQYTFGk1CdDE3BBfCuyMhXodPZzbHmHzmPBL0d2c7EGhRPBtxvhfLKlv
 TDsVRCjNrKYoBTvZQEKleUT25wf71JbT62fi2tJzivCMt9j5FATDtHzxofh+UX/jdWyJVPYuu
 AdjgR2z4Pm8pdT0CcXOscbhb8nQcOVn6ZYLwgKYBkVahv1EyJwN4ZNryCpS8hgCm5xq4t3rSu
 1P2uyZHqmmHqwiXi2I2EKPhaXobN3Glox3Ea2s34IM5VXY4NBf97PTbMp3WmmZpkifXTIGHEb
 LfTUYSfN5ki3FzU0kXoFMHMULqYI+8ehZ3KbyeZS+jww+iVyND3NjIjjSe2Scu3w2mtmQmboG
 VyhyMqtuQcYzo8H9aM3hrH24WZ9yxKepN7d/N6BeqbjB8vAswymtKuYCDsLrlrxcLcx55lARy
 sLhlx3XgbKsDMyY+R9KrFs=
Message-ID: <20210421063209.r-sKUgVdOFEVjN15ctRmWnOnGVTO2sqmoHZ9oJi_0ho@z>

On Wed, Apr 21, 2021 at 1:04 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Thank you for addressing these. If Rob or someone else can review them
and confirm that they all look good, I'll apply them on top of the branch
I already have for 5.13.

     Arnd
