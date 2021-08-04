Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA91CC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9686A60EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9686A60EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eh2fxL2hKPT+S883P+DfVhbZ7tADXOA2SQEA0WnXllk=; b=E/E2Rbav3KWMUO
	Fj/cGonfzPvjWgjJGeCrpTo+KRy6OduwEw4RA5nFIFVel+AJXdWxPJ2cy0NpbFXrlVOfAlhBqPrUn
	NkYcYo5qFFYBjXbiuXL+O+nupImIcbLfiSgHp78Ii0XTeLn2EVWm0KL8VW58A5kYnl11WTahBj784
	WKua+dCq6A6nhndvuTadUhYlEMLnusMpprLr7bPJ5gYnbDEEWnMkYp/cX5eqRL2BcG3Mwgc1YUvGm
	vjrhupJ/QTBpOVATN7c5EeA2NoFf8fTuuKwOXUZ8ckvZwWqx8lI4jzwymbJ6scu93qVidgYW1W7Gb
	+BvvRGtdHQ1mRQSkKHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHIf-006CoQ-NC; Wed, 04 Aug 2021 13:51:13 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHIb-006CnZ-GQ
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 13:51:11 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MplPh-1mwj0s2aY1-00qDzw for <linux-arm-kernel@lists.infradead.org>; Wed, 04
 Aug 2021 15:51:03 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso3999331wms.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 04 Aug 2021 06:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM531fto0REFWi/GDo6SmF5Jmp2d1QO7M0+lbm91Ndv05rY0dZPl4o
 yn7JRA51OXCCX/r7TI+TSLqTRCDehsNIGSADdbM=
X-Google-Smtp-Source: ABdhPJyNFXrQChPOLZS9aAXYYL1omRQ7dj4KugUgr5B6iGIyUO+NAtViqzCeM3ydmA0f6eM1ScWfqCiaf+g9Xa3Yeew=
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr9756314wmm.120.1628085061870; 
 Wed, 04 Aug 2021 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
In-Reply-To: <20210803124506.23365-1-patrice.chotard@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 15:50:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
Message-ID: <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: sti: remove clk_ignore_unused from bootargs
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, SoC Team <soc@kernel.org>
X-Provags-ID: V03:K1:nuYlZmP9XJzx9tDEOF7n//md1pAFUMVB7KDx17nkOsFnyHQN0KX
 D2czFprNLSgeQEDQ5j+jyFUdsXaX9hQNkC1Y9EmOeiKFBFHvZD3fBWoQ7nPgpiRXijK2bgs
 /Fq7gd1p6OsyqjvnOkT8MtbMV8+zx1W5hClsrpMD7+93CWA1ksT4MveQDItNbwxZYd4t7VB
 4S4+rCbW4gG7WDi7zySYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nIm2lgU8h4o=:MijsG8YR1NLkK8qX4XUuhT
 ofrV2Y52lSG3cP9Psf+pyy+011gRGg5GRUKSAFSKcEX7lkQCNiNiY23StuupSfpjyRaPGJYY9
 8dEfcZKyI2e+aMQs5vzXeawCSdKVxwvemo/45ZBkz6OfNwz8rw4J+YhdiNo46zSpx6GKzyWlh
 FpKbjb19JgxwaD93uwVZQIYwzobQEpz+0JAP4c6IeJv9pmT4UEfS33LVxx3zGrd+vsI4UqXfy
 f2kHVu0OE6ed9qehDXFz9qQfczYom+g5bhnpcUEWOUcfTPsx1BtZCPZwyD0EshMBKCngpZYC6
 g+bfgkMHtRrk+WwDhESNwMJDLQLhCIInMxjjsr27tdKKN6XYLdQuLbfMYUyPKZRRWWiMMq+4Q
 trzMQCIcQqnmCgwd8+MBp9c4574sonVs2wB66brVn1N0xfqa+sh++MoQOcf+lugR1KZxSio2J
 ED5MyXdqjjDEkf0yEK6MiWUIx0zf/09B83CI0ukAqwHBGDTJxRVHyckRnJprqnDlM4pYuF+BH
 c6nnUHgoNEK6SsB9HV8n/LIo6QZxPPuY7SDNsragNHHxKDOM0twsR7RLonotFIPdtmH9Hyr0X
 AjQqxYeQmWiyJVoRj/7jEjzYWLtikAfscGb96CfMzHK0wTC6jBme9At99Dwm1eMnX7OyYyQBg
 UxGDBeoZRVFTYFjZbsuMFN9cM+AWS3BClY5BVoD7q+ar3SEXvuNq13eFVsqCXhs4eZM8Py8rJ
 pvXLKF60D8rq2KzH2Z87W5gkeS8Ep4+xuX3qSiVcZdmdtlT+QWkS174Rr+RvDcfFi0GjcLh3d
 LSWRd3i1Mp6aYP+aZd7rtlEimo8zKvq9lU7WFI2amGOxcNcoIyRtU9aUur1BrC4FceT1cKyZU
 OcbAMdLCQ0lkdKjiXOKmXyBfpAQR1OIsqwHzsRav7L9uT3Sbfr2Rh+9kwhCeiKe5ybztpkuz5
 nyI75FYv+dLGqAf2zIf5qFt8OyDQGRMPrgdAI4B1CyyMgeD+LjUFH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_065109_883719_56E1E1A2 
X-CRM114-Status: GOOD (  17.83  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804135045.ynaHSRcHJwWVdMNshS3CbmxqBhPl1LVDsW81CjW5y-E@z>

On Tue, Aug 3, 2021 at 2:45 PM <patrice.chotard@foss.st.com> wrote:
>
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Remove clk_ignore_unused from bootargs from STi boards DT.

The patches look good to me, but I'm not sure what you expect me to do
here, as you have added soc@kernel.org to Cc:, and other addresses to To:

I have dropped them from patchwork for the moment. When you want
them to be applied to the soc tree, please resend or send a pull request
to:soc@kernel.org, until then, please leave out that address so it does
not get into patchwork.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
