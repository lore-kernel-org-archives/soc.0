Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F141C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 13:16:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1876760F9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 13:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1876760F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOAlHDiP+F1Oy8uchiEpb1/XqO2v7HbHOJOu5Z/VzfA=; b=eITqEEBHuJDY2f
	pL8u3mk8PNIeLSnQWYwkfKLy1YHIUQmwPqW5OrA1zrpWAnBxJ6rXb4LHlksnwG7CKNoMVZTn4Rt9o
	Ma+avTX4dTiCNZEuPtJkepq5PAUlgjgGAgFuNoiTR3YYFuonRTFcv84lhCNqISGJrYBrFdrXyyqNu
	KtoO7Xj0FT6dNSA+ShSN4HIEV2k0q2bFyUa9TLqC6R7sGDoAz4LI63DuaczoXLsNeGNBoRwcbFAUt
	J6Tb2WS0H5OQaXz8DFCkPcpYMj2RBnctxKx7tLKrcxTHwafC2tUajNW4ZWB4lT/4stLRF1HTSBSGV
	Ht2zPZPXLwNqLeB5kDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYTEY-00HSHd-Id; Thu, 07 Oct 2021 13:14:50 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYTES-00HSFN-1L
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 13:14:46 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfHUx-1n0e6W2f07-00gp6F for <linux-arm-kernel@lists.infradead.org>; Thu, 07
 Oct 2021 15:14:39 +0200
Received: by mail-wr1-f43.google.com with SMTP id m22so19100239wrb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 07 Oct 2021 06:14:38 -0700 (PDT)
X-Gm-Message-State: AOAM53376LvYU8qZdkxMp00oWAOmEa+38degLL0CIeT8wnp/XCSuLiH2
 kNkDoeFTT+7ZPYoJPLX+da+ZbxnxHTT9XVZS+68=
X-Google-Smtp-Source: ABdhPJxlorxaf1Zgj5Rs+eFsSNCfJHstb4n53ThIOsns1KYcxF/bXpbsGzOdHOqKwYnWgIneWV4ZKX7ki2fMu7OD7KY=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr5369225wra.428.1633612477750; 
 Thu, 07 Oct 2021 06:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210821030519.127-1-yuzenghui@huawei.com>
 <39c2b2f9-4de2-8e7d-2135-96f1dab750e0@canonical.com>
 <5991e347-18f0-30cd-58b9-9e3276bd98bd@huawei.com> <YV7HGniKSKe7nXp/@arm.com>
 <1ebc899f-b7d7-fff4-9204-a0edd2be4387@huawei.com>
In-Reply-To: <1ebc899f-b7d7-fff4-9204-a0edd2be4387@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Oct 2021 15:14:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a30pdkERK2CREDmpVDtL9+mVBU3iok8DkNoayOTSE9yFQ@mail.gmail.com>
Message-ID: <CAK8P3a30pdkERK2CREDmpVDtL9+mVBU3iok8DkNoayOTSE9yFQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: drop obsolete ARCH_* configs
To: Zenghui Yu <yuzenghui@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Will Deacon <will@kernel.org>, 
 wanghaibin.wang@huawei.com, Arnd Bergmann <arnd@arndb.de>
X-Provags-ID: V03:K1:JyGpf1TrhBx5wHoNrKvK+nLv5FvCF9bE1qWitarMed9CK/pQFO4
 rKNa4dMOn4e7HVVRD2PC4YRfOEbv+wNSsbL3ylJVUa+EmcQdgIQEe4nPmhR+yZeR9ZTOZMP
 qbA2LY8t8j7YBrS0dkKTOZX5mZP3v0tAFy3vDvPTPtGgxpHlJRqyHnZJFhUsm+9b1HNcBE8
 4CRlrZ7PUQQj1PCgKobrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nnOVLtRkMN8=:F6niPZcQu5vmtGPHO6b8Xa
 uXui6vmcNiJlrGHxzU+aWWRIPBuWuUXVYsyrAUz3LoLp6z3nhaoU0yOiOly+NdnqrLFmS/kjm
 t1/zWtb/IwRAAel2kwkQtKb+2WYv0vXQeOXV2C3s94aiBrvqR5hfSOz/6oPIFVSGNfi9NdBVM
 yQQsmieoW99UIdFU6dlqlZI2DeSad3jbYaGqaKZMsEiyTwxcXK2YWAFotKEFzpepGXlmRd1mr
 xFAXNRrhw3iM4atcRaIcJoXHWEdiMAXM2OLwGOC4pmxFDAUVlEBxRk9ikNM3WEQ0nyn8/NzPQ
 tYL+PneOWQEXpuvdJdJhMxHsRjMB1XW4ShVpz3DfPxri24CRUXuKJQ40vns9oWPPie1ibMXxK
 WfdfqLicNZIcpY361xyEsKP7OJRWRp3wfAMxIX4ToHfS3LcLw8xwujE5cEnCXKKvMrDmRLX26
 72xXmVNZqtHCI0s/pbIUIe34RKShUYCYRg0jXEkDOjV9XgVZPJhHMnRs8G9OGwV4KKZosXZRY
 fDUemrlGgAthcyAsHQcCyEfpsUYI5u2hM7voWa5s+Rw4rj6XxB4rGqzV+1ffnM/P/RKYre05A
 sUnrN3g+b4Els4+MgbwYp1jcFOaibOWR+fbHZMLo6RiGxwCUf+bT9EQ99SSDyj/Uo6kIlsNZ+
 3dbLF/ffAYxZFaK+L2Ig5OHM2ThiRoWHpemWuUiljyWzfmefu+RMaLbIemZEq4tefEHPDUP2a
 8rwLH0Ugu+YMN6yTneOPyBbvAEbh6LaTFUhhVxeIAfv559DbuniqYXiSJPz6B6c+dsf0M1xZN
 tIWn+NBCCmwr6Ths/ELUyDsNqSIRNySAMNmwU1HaL32gW/le8Rh8eLs8YTL+6G8Cl3up4BgZ/
 sNtV+rjQ6mzmzHKYnoFQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_061444_424639_FABB138E 
X-CRM114-Status: GOOD (  19.71  )
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
Message-ID: <20211007131421.3hP9PVCMH2QGZg3vP15I5Qt5HTGFbUfTwmqxA0urCdU@z>

On Thu, Oct 7, 2021 at 12:24 PM Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> On 2021/10/7 18:08, Catalin Marinas wrote:
> > On Thu, Oct 07, 2021 at 05:42:46PM +0800, Zenghui Yu wrote:
> >> On 2021/8/23 21:01, Krzysztof Kozlowski wrote:
> >>> On 21/08/2021 05:05, Zenghui Yu wrote:
> >>>> Per commit 4a9a1a5602d8 ("arm64: socfpga: merge Agilex and N5X into
> >>>> ARCH_INTEL_SOCFPGA") and commit 89d4f98ae90d ("ARM: remove zte zx
> >>>> platform"), they can be dropped from defconfig now.
> >>>>
> >>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>>> Cc: Arnd Bergmann <arnd@arndb.de>
> >>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> >>>> ---
> >>>>  arch/arm64/configs/defconfig | 3 ---
> >>>>  1 file changed, 3 deletions(-)
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>
> >> I have no idea about which tree should this patch go via, so a gentle
> >> ping here. I've verified that this can still be applied cleanly on top
> >> of today's -next.
> >
> > Usually defconfig changes go in via the arm-soc tree rather than the
> > arm64 one.
>
> Thanks for the pointer!
>
> [+ soc@kernel.org]

Applied to the arm/defconfig branch for 5.16, thanks!

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
