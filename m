Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D33C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 15:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DD9C6113D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 15:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DD9C6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cusCjlnJkyL8pRpG4ePieB7wuhCPFnsrKr9IZ1K6QUs=; b=j682HpGUMeUvyJ
	9Z34NXCSaCMsN1fs8hdCXmBJHYntemndgnaHarl0zXUfyBrsrl/yV8B7bwpreR1pr/MCTLfoxvoNF
	Bm6pN7Hatl16bKIfx70+zPVopGHNCS+M2dI56JPSvkh3JirVStv8VwIYBHcvadNMPiITQl1eyRx8m
	VxG/MIK7fa4L/5aaiGAQAr6F1/i5GjnOyISTBL/oCGcDkzcFEriH7PCfbfHbwHWgpizOQf3hzMDVN
	QfXsJ6K/HDja/T3EVu6D2HleJRBlh/qPbOHgSB9GYFM95r6huz1Ebjy/Lev/p0lHsj8tszUn7BA8C
	U0JFFtwAV4xRk15MGtHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafwE-00HJI4-UM; Wed, 13 Oct 2021 15:13:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafwA-00HJGj-1u
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 15:12:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A573E61152
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634137977;
 bh=hu+wHuAijt6nLgQe0LYgPk9kgIafUqC8hB4S6oJeOUE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=igGQFBKD+aeklpT+IPdsjPlKZEg6f04goBiWxRoy2OWBnrKJGPdtzPQWgmaUthtl6
 oPymhGXKlrbeFMyOyOGGrJoQNRzOSgprHd5Xh4SVrjv4+dsuhgzb/lFmLkU5XMKuEP
 9l3w00whyF2CJvbzMEENWcrS61/0AWiwLI6oJZ4TLUxgcG7nZz2uQhLrZ5C5lRKmfj
 86JNdEPgP4XT7jPrxMcsEpMxHbBnJck3Std/skGDFYGsl82r8aXQ5l48mWJiSZqH2Y
 8wne4X2O+ynNanHoT6jHWfDAXWQzij6v0AcEWf24wtSW/TOymzQ0i6voLW9akb0zPb
 A1aIdFn045LYw==
Received: by mail-wr1-f54.google.com with SMTP id e3so9377653wrc.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 08:12:57 -0700 (PDT)
X-Gm-Message-State: AOAM533cOFuR0j7rLxWmqiOhGdctTd1EDNAgCfmiXT2DjQSAzVPk5ZtQ
 Ry6I2QVrutVJkdE4p6vhmYR2/eQn9SRg1hHFRMo=
X-Google-Smtp-Source: ABdhPJz7uRpoRHTq/reu8G1mGsTqoPz9rsP+XTRoDPCVBiZ7gteKr0XijfxMraY+BsUhsvUuuE+zgbJGYeSE+IKaDY0=
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr13127132wmi.173.1634137975774; 
 Wed, 13 Oct 2021 08:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
 <20211013143810.2101838-2-arnd@kernel.org>
 <CA+Eumj5Fx6tQv9B9R9iBCP4C=f2dk3szCGcisvPHYfMWpsCCfw@mail.gmail.com>
In-Reply-To: <CA+Eumj5Fx6tQv9B9R9iBCP4C=f2dk3szCGcisvPHYfMWpsCCfw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 13 Oct 2021 17:12:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0BodYmn+n9xLxHxCkdQ+nmNAOV7U3ky6ME+j4tatz8qg@mail.gmail.com>
Message-ID: <CAK8P3a0BodYmn+n9xLxHxCkdQ+nmNAOV7U3ky6ME+j4tatz8qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: exynos: fix cpu unit name warnings
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, 
 SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_081258_152420_12C50654 
X-CRM114-Status: GOOD (  12.56  )
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
Message-ID: <20211013151239.Z1ZA-ZTBDUJGMgDoSwXKjKspBW8V5AHquP5jVIRFJFA@z>

On Wed, Oct 13, 2021 at 5:01 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On Wed, 13 Oct 2021 at 16:38, Arnd Bergmann <arnd@kernel.org> wrote:
>
> Thanks Arnd, but this was fixed with the next version of patchset.
> It's my bad because I did not drop the patch from my next branch after
> spotting it, knowing that Chanho will resubmit the next day and then I
> would replace it. This replacement happened next day but linux next
> got the older/buggy patch.

Ok, I see it now. Looks like I forgot to rebase onto the latest next/master
before testing my patches today.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
