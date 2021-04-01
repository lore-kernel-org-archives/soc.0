Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949A9C43462
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF9CC60C3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF9CC60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lY/i/a45nDQqBnXWbzSHZ4zWeSXqu+R9DAtAP0+FhZw=; b=rUzIsxKSZFRWNXhFb8M5wbEFz
	jIZDTqmR2Ybxa0Ah6JB1eIkDdVpZPA0ql6VRP3BQ/ZD56dfHEKr63AnLeb+7cCGA7vgjUsbg5p6+j
	8CbyWfaOK7Ki2wfinjJZ2+OfGF+bUt5mwXDg5YZvaD5CRlk8TR1nP2EIblbHrQxgZInu6nCbibSWO
	RJ5zj2P/KjlzYFfOzTb08UdBcVZmC4vLjGLtjbgei017IVsiYepvItTjf0Tz4NFLNDFRa1B0aHFGy
	W2Mokch2SYOqvRNm+LRO5OEluBnsyrWb15syoWxnIrbPO0A2Nhq/kJrVpvnvQJvd2SJMrjDuEQR7U
	tk8ItBlBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3jH-00At0G-Le; Thu, 01 Apr 2021 20:15:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jA-00Asxk-0H
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:15:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04C70610E6;
 Thu,  1 Apr 2021 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308138;
 bh=LweJqzMMPk3ru/FcLFu1wFQimre0Eokcq6QXnWa2MYU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EBTWZxbjQkKDtM+9XHLsCx2tx7ng7plZf/kA7UVhohoARVOQRcny7NfvwaxSHML63
 TINieDj3Yqvh1NmneqHNkBtraY60OrLb6pUGF5m1xCB827bfsfWVGflayUx3FT2yk5
 +vdA/FIL38l9i2NP36vYbvi6x8zzD4lxLctfKm+JZhyQGoTEQ6wZXE8MZwaWoUpFi1
 yFDw1my0sBFxi21t/nr2Tx0LhtqGvMyDMEsGSQrAnBOm6bAnJHI74AlKJYfbLwFWGe
 3Ahnma6Ikc4ad8KO5Y1+wMe+/djitfsVDVyPcQsb4dRdxnDYY8whhEGEEbLzC1cRwu
 8A6zV4+v3RJrw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, w@1wt.eu, olof@lixom.net, arnd@kernel.org
Subject: Re: [PATCH 0/3] ARM: mstar: MPLL mop up
Date: Thu,  1 Apr 2021 22:15:16 +0200
Message-ID: <161730808589.655497.9969521332794261660.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211541_760231_1B5B8533 
X-CRM114-Status: UNSURE (   8.57  )
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
Message-ID: <20210401201516.7rPsb9fryNutiJ51_2xdEGWk1LbemeTuH3asy_M2NpI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Mar 2021 21:35:39 +0900, Daniel Palmer wrote:
> This series is just 3 small patches that got left behind
> when the MPLL driver was merged.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20210211052206.2955988-1-daniel@0x0f.com/
> 
> Daniel Palmer (3):
>   ARM: mstar: Select MSTAR_MSC313_MPLL
>   ARM: mstar: Add the external clocks to the base dsti
>   ARM: mstar: Add mpll to base dtsi
> 
> [...]

Applied to arm/dt, thanks!

[1/3] ARM: mstar: Select MSTAR_MSC313_MPLL
      commit: de73b5a97bba1538f065e1e90d8eeac399db7510
[2/3] ARM: mstar: Add the external clocks to the base dsti
      commit: a93cf651df08c370e622c3aea456bc729b352437
[3/3] ARM: mstar: Add mpll to base dtsi
      commit: f374f25aab6f10ba5e442d8f81dd94d960276cb5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
