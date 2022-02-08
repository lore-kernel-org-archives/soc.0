Return-Path: <SRS0=FMNg=SX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA22C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 10:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BAF6C340ED; Tue,  8 Feb 2022 10:15:20 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E112DC004E1;
	Tue,  8 Feb 2022 10:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E112DC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBDva-1nSyN84AoA-00CgXV; Tue, 08 Feb 2022 11:15:17 +0100
Received: by mail-wr1-f49.google.com with SMTP id i14so120309wrc.10;
        Tue, 08 Feb 2022 02:15:16 -0800 (PST)
X-Gm-Message-State: AOAM532RdRVNo5mo/klEXHL35wH3TDD4pVYe+WgMd3MNUtrcueUucQhD
	n7IOBfhY+NJ8s8mo5oSRB5/EX5Q/odx6EHuSoIw=
X-Google-Smtp-Source: ABdhPJz8d1epjp/OItbhOLl98efZqJWCf8hF6YG8ZUN43ZGmwGB36NWVDbTrT/bqPxNxa4LfyomzITK0xNR95kKkl1g=
X-Received: by 2002:a5d:500c:: with SMTP id e12mr2895743wrt.219.1644315316526;
 Tue, 08 Feb 2022 02:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20220105213603.804026-1-dinguyen@kernel.org>
In-Reply-To: <20220105213603.804026-1-dinguyen@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Feb 2022 11:15:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0A5tDUKpFaRUJku97ui+EpYO8NoomyrAXg==GugBxQbQ@mail.gmail.com>
Message-ID: <CAK8P3a0A5tDUKpFaRUJku97ui+EpYO8NoomyrAXg==GugBxQbQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: socfpga: dts updates for v5.17, part 2
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hIgBO43IN5GV+ReZ1cFTV4QnqMqyz+QBTBiaqZ4oBTd21LY0cTH
 nS4d3ia85U5tfg0AwaHEr/7lRjG/DoQNvILRqamtCRPaNDFAmZvWgWHSvvRFBjEvaQA0GaO
 XbtmenNQjVcjhib+A/vg1Mw3xBukvqBHNVBlNEUaxbwBRjw8Bfguj0p1Td9Ehu7fIdag+ov
 FFNjCsroTAf1Oe/RTxNAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AoUgsOLNlYE=:OlAuidl4luY8zQi5hfvHzu
 mjwui9qqebYGgN5t4r6Tw3QIQSdZfblT3VioMQB+zyFWOpFDOxguDPkLpc7lCoxo6wZwrnLys
 FsCzJ3W0DdtH61BcW4O3oHr3S4KBaApdNah9RhUOpUUiuKi5rY2F5Rn1Wj5+6y+bREhbZix8B
 v34hLOHIpeKThUoBP4t26vEcjNlwKCplAMDHhaCfFuIvnYYW31eCDEXVKfR3s6YkQ/JASwiTL
 ukNxMhizZh87puFo9/FkxqjyecK4R22kBIeQIqDpbYz4S2YhTnz07XXugNdn/Z/nmJXBNyxHI
 UsZHut+cmtDbQLsN7zZCW4GVjq15iaQZigWtCAj9DZa8qFkL+pO+Am4WCXgLTtM1lanlCiZMj
 EepTB2wcQX3KJprvPZhi7TLDXNN6Y4zkCbXltz6IbxZu9xdyzyKcWn7tBA4izMNOVGWSMLn6/
 qZapNjzTunZIbd93Wc0Vw3c0Bi3Bc3g6iFCe47wzJZ/Q8LS4XEGyCGtMr6I4y3FyHBndwYtBm
 3M6n8ON4wwuN1XlkznKW7APszTCXl+8p0xF/3lGXLa8j9aGuWDQ3uMPvkTiLAWBsrG/dh2d0j
 9Y9EiT+7QWwm1NyFxovrejAo2hQA4YjaCog5oEpfm2XOc/fuou2oSOYRYcIIsOen+Jzn2U7Pk
 V3K9skKGBbbcdWgAB7VJ5Rq91QYTabB2wZXAaideIV874MeJR71JZ2WoI/0O+o5DONFBq92WD
 XzhyfINWChWkaRihknWIFxh9fvvtEgNI2sYz3d8OPbt1cwEoJmhpx9WqHpoqSprJf5fR5vS7B
 otGb+mPO0PJP4guK+J1KkwNPI9zoCF18ecHC7ZDtSQhW9/JJ0k=

On Wed, Jan 5, 2022 at 10:36 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
> The following changes since commit 8dce88fe80a858f34bb5b46470218fe478d251ee:
>
>   arm64: dts: Update NAND MTD partition for Agilex and Stratix 10 (2021-12-01 08:07:41 -0600)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.17_part2
>
> for you to fetch changes up to 0020e9e1f8d3348dd5c9a37612b1089c1a47553d:
>
>   arm64: dts: agilex: align mmc node names with dtschema (2021-12-29 04:57:47 -0600)
>
> ----------------------------------------------------------------
> SoCFPGA dts updates for v5.17, part 2
> - Cleanup of Altera/Intel ARMv7 and ARMv8 DTS and bindings
>

Hi Dinh and Krzysztof,

This branch was one of the things that ended up not making it into
the merge window, and I have now dropped it from our for-next branch
as I'm adding 5.18 contents, sorry about the mistake on our end.

I think everything still applies cleanly and nothing in here is urgently
needed in 5.17, so I can just merge the pull request again for the
next merge window if you prefer. If you have additional socfpga
material for 5.18 or some of the patches should go into the fixes
branch after all, please send an updated pull request instead.

        Arnd
