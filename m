Return-Path: <SRS0=LkPm=LG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F147BC48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jun 2021 17:41:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF3F61029
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jun 2021 17:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF3F61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NZ/4CiV+mQ/okti/RdYLxStRyTjOu3+2m6wunsKNH3o=; b=TF51coVprPIlEg
	wf1zuAouu/wSVMK58MKx91m8kqAQdDAjEFaRazpWhaErVPQAZlNX7stKPVPIHcVHkKX7DYhAnPSjn
	o7dbu5LBfXvIY529Tk3IMisM9WRkVg9+uS87z+yp6N+BvIP9fs2Wg5ghGAeaqX6RHDEfFJdtxjMt4
	ne1vSGJVScsIFxz90ZPobEuZwSxOaQO6oE02qwq6IqSS4e1m+MjJrSXfCb582R40AuFXzk7V4DUkX
	5KovQ+D4cUjuFzZyNLS1vwQTvm4GR7mIbclWeAs6nB2/R760SClIBOaKqWbYoBqlG6zaadtus83mS
	0VcYWv/ymNp4LtWmkpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls7cH-008t9p-UT; Sat, 12 Jun 2021 17:40:18 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls7cD-008t9Q-T2
 for linux-arm-kernel@lists.infradead.org; Sat, 12 Jun 2021 17:40:15 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id im10so17435987qvb.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 12 Jun 2021 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=792MN8Q01TsEjQvOuKUTJLcam45aGsdx9B+TJ/7s/WY=;
 b=Kill2/I0AYROyL7hXkgFZNPRf4ZnD0HhJM1NwjBe6GbFys+CQo9iD34/j3KokskJ9+
 GSYMIEy0plvw1gFwNOJfneSDNoaTHcfd8nU5RBG9No8mVP6+X7QI6JMo23rqz9ALJOzT
 YCqMdQlEzAoLwv8GkCpDmZdgABOoy7KhK405c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=792MN8Q01TsEjQvOuKUTJLcam45aGsdx9B+TJ/7s/WY=;
 b=W8SPe38bVVJWvI0hMGBIWYgGhLd6mQx6DoIoeyX/nQ/ON3At2baFqvgKZMusgGqIrH
 UEtDfay+hBztD7HSzKNKXyXCnU/euTREmz+ceVG/RBY9RBb8vvnPqGbmHB3pkiRBjDCW
 0OurJiGhpGBmnnVKOxz0bGoR8fALKTDJ9hD6Y9XK73McGdZMhG/LDPAT0h8CsC5rjkEy
 dXwVtyhwIXtmErRzoJDRVFsuOcxRN7F/zzJ4lUur4Ryr6iDkn5d9KjNGOzFuzu/96XX4
 Xj8D1dNcxzTxkjzPXcnrfOTXLaxTK+2zekYAaaXxKJl7vtDyvEWS/UivHY6NBJOM8P8e
 l9cg==
X-Gm-Message-State: AOAM533vgXBIR/IE8qxRzUoTyZBcZ9bewM5gnmQOUs3NeT6ZR0fw9WRM
 4Lh1vFFbQWW846KMBbtJ/Nt8jriptm9DIUllhNZOwQ==
X-Google-Smtp-Source: ABdhPJzsg8UxUaXch78d+uWHZZjCwPid4FgFs5BfE2DdGpneuGxgjKvCYQq8yl7I7K8wXeWtrlBbC2iz9MvFUV2O5qk=
X-Received: by 2002:a0c:f0c7:: with SMTP id d7mr10622178qvl.45.1623519610207; 
 Sat, 12 Jun 2021 10:40:10 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 13 Jun 2021 02:39:59 +0900
Message-ID: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
Subject: [GIT PULL] ARM: mstar for v5.14 v2
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Romain Perier <romain.perier@gmail.com>, 
 Mohammed Billoo <mohammed.billoo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_104013_963249_3DC5EFF2 
X-CRM114-Status: GOOD (  10.26  )
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
Message-ID: <20210612173959.RTyBABs21vaqVo9QBcoyoMvKgWoeth2hFAV_ppbgtKw@z>

Hi Arnd, Olof,

Here is a fixed version of the PR with my s-o-b for Romain's patch.

Content is as before:

- Romain has stepped up to clean up some of the ~300 patch backlog for
MStar and he added support for earlyprintk in the process.
- In an effort to do things properly I've moved work on the MStar
stuff from my personal github account to one for this project. So
people can find it I've added a link in MAINTAINERS.

The following changes since commit 614124bea77e452aa6df7a8714e8bc820b489922:

 Linux 5.13-rc5 (2021-06-06 15:47:27 -0700)

are available in the Git repository at:

 https://github.com/linux-chenxing/linux.git tags/mstar-5.14-v2

for you to fetch changes up to eb5e7693630c6039d040e428840be82b7e3a8614:

 MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree
(2021-06-13 02:12:18 +0900)

----------------------------------------------------------------
Daniel Palmer (1):
     MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree

Romain Perier (1):
     ARM: debug: add UART early console support for MSTAR SoCs

MAINTAINERS            |  1 +
arch/arm/Kconfig.debug | 11 +++++++++++
2 files changed, 12 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
