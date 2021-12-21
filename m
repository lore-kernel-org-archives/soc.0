Return-Path: <SRS0=tOqj=RG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E40C433FE
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 15:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AC48C36AEC; Tue, 21 Dec 2021 15:56:08 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8989C36AE9;
	Tue, 21 Dec 2021 15:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8989C36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MtwIW-1mBzgm3INA-00uImg; Tue, 21 Dec 2021 16:56:04 +0100
Received: by mail-wr1-f46.google.com with SMTP id v11so27800537wrw.10;
        Tue, 21 Dec 2021 07:56:04 -0800 (PST)
X-Gm-Message-State: AOAM531b7Oz5X7xGeZXvtrop5/yBd8V67cdhX4clH0WXe6b9F1947iE4
	ePqI084CTmK/KokuOZ0+l3+X1fv3dHqGzXgHSOM=
X-Google-Smtp-Source: ABdhPJxf/tJ7mCajW2ItM8WsByzyghssZ+nfXJxfafMfPB7JDp3ZNP/6lkEbkqEgC9ywiAmTR2r4PviIBqZZ07+hCrQ=
X-Received: by 2002:a5d:484f:: with SMTP id n15mr3152015wrs.219.1640102164401;
 Tue, 21 Dec 2021 07:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20211217172806.10023-1-vigneshr@ti.com> <CAK8P3a2VSBvOn1o+q1PYZaQ6LS9U4cz+DZGuDbisHkwNs2dAAw@mail.gmail.com>
 <06e60038-1365-fc35-801e-448c9025fb2a@ti.com> <20211221153250.GA2081238@bill-the-cat>
In-Reply-To: <20211221153250.GA2081238@bill-the-cat>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 16:55:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2wNNSQkN_m3DzEF5RLmq1aED1JpOkXW9Yq13+ypiAaGQ@mail.gmail.com>
Message-ID: <CAK8P3a2wNNSQkN_m3DzEF5RLmq1aED1JpOkXW9Yq13+ypiAaGQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] arm64: TI K3 SoC configs changes for v5.17
To: Tom Rini <trini@konsulko.com>
List-Id: <soc.lore.kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>, 
	Olof Johansson <olof@lixom.net>, SoC <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+mdk7YqWJJdfFMlg2vin1QDRAPZ4/xU6THS1d9dsakokXSGDBp4
 WbzOdBamocmMlp9bYFsydy3uNVhvudFeVYeG0ZgInAEnJIQKFMyGBcj74cD6cbmAjFUYSfo
 tI9gXkRq5VcmJRgOHG0jJrMc/8fdhnE1tUEwqwfjsZykvufaLRQBzCZwc+iZ65aswAqR+48
 5enntMX5zbM0cAwaI3f7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6wxbPH9jEUo=:jPZhSukuARooOklREPdqdR
 a2Uk9D8jCLjC6xQn2J6pjPJGKAjlIKDAUuekGlv/wfTGA1FVwXbrKT3oQYy6yW+Cow2FsOgM5
 CwT5rXXD9OwVZox3Az4bAbeppwvcfMrscq8xm12kvJG4PTlCi9gVjWvXQps8MER8+d32OpaiV
 QbYQ7wXcaPs0gmpGW43egBiYwacGk9RARNsb4MsEibQgNZtClCOAnBFbyOvmxJ+5AOfOvUKF6
 e4JsWEuYlrgrkMV0oGP7ha27g5cGRjSn5FPJt+efcAwig5oKidxlbUwJm3H4WfRRQy34j8ITZ
 9AkwSNCgQzHwF2EAa/JedhLmrZvwhbc540rkbXicZzgJKKeWnKici6jiIwY345WNPFrrOK81h
 JF6b+hDAid/FVYMkyb7Q1PXPX7QCOe+fzntu606NDAnBgmfQ/HDfCo6GxkU8tz5W26txzltwG
 xjAcny4nCmNSEHKq412aUHW6HisF9wxKzfAwAE1hz1e20AqGzPa8/Woshhml0J2yXHk7bvUi2
 geWJDthXSKcRdFoJ7cqc7qarGeVshJXlhD8IRFG3mWyv7+GZcsXZ0//UM2QY6ktREbldMPPm4
 DNe//IAdpmbblws9HlC0s16lldIKOEZfazxL+aTjFhEo1sHhsBNVZ0s8WiGhbfLqIgY+EETPw
 TC9n9lG930HALbUjQldHGq6s8CTSxdu7d5AC7igx3k6szSL4rr0AtmDgT7Zu/XvjkQuuhlBIZ
 XSMQrtyh7/MPTQuNXHbMOmIFhjoj0XztKAIElGRgx2Q8I85rGyrg15Pghc3eDQifiTrAiC/ae
 SKs1ZV9kx+SQIzNltdVcPb+FBlFMfNxAmKoCnuBPQdJ5qNQSeE=

On Tue, Dec 21, 2021 at 4:32 PM Tom Rini <trini@konsulko.com> wrote:
> On Mon, Dec 20, 2021 at 11:10:25PM +0530, Vignesh Raghavendra wrote:
> >
> > Currently its not possible to build PCIE_CADENCE_PLAT_HOST/EP drivers as
> > modules (symbols are bool only).
> > PCIe is not necessary for basic boot either. So, I can drop these
> > configs until these drivers are build able as modules, if you prefer.
>
> Is PCIe required for basic boot for the other platforms in the defconfig
> which do enable it in the defconfig today?  It is required for non-basic
> boot (whatever storage one puts in a PCIe slot).  If someone is going to
> be fixing the PCIe driver to be able to be modular, that's fine too but
> I ran in to this trying to see what works out of the box in the
> defconfig, on this platform and hit both of these rather large
> omissions.

If PCI is often used for storage, then that's ok. There are a number of
other platforms where PCIe is only used for wireless networking or
other secondary devices, but they are still built-in because they got
added before it became possible for PCIe host drivers to be loadable
modules. I would like to eventually go through and turn those into
loadable modules, but for the moment it would be good to only add
built-in drivers where this is actually useful.

       Arnd
