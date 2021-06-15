Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F159C48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 20:43:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3336610EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 20:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3336610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VLAUEJuHEQSe+KcbqNSmoFzo8l74cTTicVLBa1nes4=; b=fy6n/DiteAvwkI
	kh4z64MMM7zLKHr9gC0UiWnog2pQTyLtYnzl7qicWWRej0zK5JcINBcRxjHt1UcmCxXKz/zAvvrnm
	xXJxHxIF4Ry1BeNMpcu6sNCbkuH2FitWOqmEXJnpOmk9fSm63tBKjk0RqL146jHk5z2q+7yyJLjKS
	2cEtdBbwQ1nMfCQ7lYSawkLBS3z6+yzMnI4kflAnw2Bv3hxjmUwXVSjWHsNxI069gvbBkFY+Mt1Ie
	n9r9oBzHCsnNnRqqVhIBBR+by1NB97WlkgjLKyaaIUPyxYSFau8smHgbZOlI1teIzLo4BPr512oq8
	xxU0zawftOUUsUK+R+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFs7-002roo-SA; Tue, 15 Jun 2021 20:41:21 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltC1B-001OPZ-Oj
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 16:34:27 +0000
Received: by mail-qt1-x82d.google.com with SMTP id e3so11743614qte.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Mpw+juSO14IXhbnXmpjJ5EumNB+SNd/QTzAxRngqZU0=;
 b=OwnhgWRxhm1q/Kky0ungmqIcs6YMw4kIeYIvfOPX05tXnfCQYLcWlXs3a49hwczWfv
 sityG8ukLre/6ZvG7QtHKDeDW0ooyQVt/8aiyd3+EYc4BfNRIKEue/5sPcAuptTUGhp4
 gr/DVnKkm31xdIPWXTKOl0neJU53IAzQh8mz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Mpw+juSO14IXhbnXmpjJ5EumNB+SNd/QTzAxRngqZU0=;
 b=puYuU3iLGz7phPjaw/K1U6k040l/jL6uLA1HKvitqH3gnDfm7ZgQ5z83+8Ic3a4V46
 lUXtzXm9BRIJa2K8SSsrpUQ6n0S+z+OlQ4eilJQk2tFR6DJDHkkRSa4xVgMMInac0FTY
 Gl9725cBnePNneTPJNf1zavMnvWQ2rSY+/LVLXka+uFoWXqccCC2PWP3TaIzrcfaH6Jl
 3PC7f8zH8ljRb0HmJdYLHD6CGxrUChw5kdKJAZBbS0BE4IdG98G/rS35I1RIBmHv0lWD
 Pk7RxN4DCj5ksJ6YJ8I2xi+83m6a4rC4E19heUEXXaNKND9pdzZKZiJKMeK0vLeNP3Ze
 SnYQ==
X-Gm-Message-State: AOAM532h5yUxmafuttT72ygKfREGG6zEN0pAJ0MMC9boSYpCn049yZAw
 Ao7kDuRlk2fEx22NIQVoF9KDrV2zHmb+4q82sDVwjA==
X-Google-Smtp-Source: ABdhPJyTt6WC6RRYHejEop/0hhJ8D7+6OUmp+FmVlPNOOZpIo46ZetWalSW1J1VyjP8Z9QFGNO88p7XWWl8nsCiAgPU=
X-Received: by 2002:ac8:7ed8:: with SMTP id x24mr500539qtj.148.1623774861742; 
 Tue, 15 Jun 2021 09:34:21 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 16 Jun 2021 01:36:25 +0900
Message-ID: <CAFr9PXknSfSso6Uq0Fn_qJM5ZnJ4QK=YjJ32kKt4XYPrHK5x6w@mail.gmail.com>
Subject: [GIT PULL] ARM: dts: mstar for 5.14
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Romain Perier <romain.perier@gmail.com>, 
 Mohammed Billoo <mohammed.billoo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_093425_873341_869F6EBD 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210615163625.6-Fb6VwyowOuy3qs3-NtTB9aUrLMto9vSmE9NCP4kc0@z>

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

 Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

 git://github.com/linux-chenxing/linux.git tags/mstar-dt-5.14

for you to fetch changes up to 8f610169a2865f6c6383d966ebbd6814c79d0116:

 ARM: dts: mstar: Add watchdog device node (2021-06-16 01:22:52 +0900)

----------------------------------------------------------------
Romain Perier (1):
     ARM: dts: mstar: Add watchdog device node

arch/arm/boot/dts/mstar-v7.dtsi | 14 ++++++++++++++
1 file changed, 14 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
