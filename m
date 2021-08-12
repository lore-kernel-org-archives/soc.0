Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4E9C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:12:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B0B60F57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12B0B60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0wyZjOyCuNnhbrTQs6JtHHAr7s0zixHe4fb579jCA8=; b=0TcrUVD8ZW/9Rb
	xCPFDpLEaYL20dwO5qnwM7y0Bob4vhDjYnFkVidQtP85cFsi+Vce9jHmQ14hXMOtwif+l4YR+6swt
	zG53T9byYPpqhpKsJMquHJYjPmZF/HEXZaLwszWQfAwUrEPLBsL1SS5xx0vAR51M0t/Jp8KfCU4s9
	WQ0OaOorl6Q+/AwUPcQNTV0r370akUn2yNx9xwi3nEKfstwUGKdISosmyzcTB6dCL9J8EOUHzO706
	zG/63g0C2AAQJo8RF+yKB1Y/+K/5sEOQm4ASpSnuvPF8A98JctX268MQGPN/xObbvRttzgS/Zf9mw
	kMW/ApKHwX14bvq93DdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHx9-00BKsO-CS; Thu, 12 Aug 2021 21:09:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtx-00BJXL-6o
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:06:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DA4561038;
 Thu, 12 Aug 2021 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802368;
 bh=oKXU65MF07vmCV1rea9TVQd6CIrJZzHSlgKopzlGqKE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P/8siX7swHkm0nuK2JfRa3KM5OK/ADcLPHKHx8Vq2gA0MdKDtBy7/bUzlTU7B3PUr
 WBPurRakpo2pJlA9Rgxx7JtvgnN7fnfReo59uTkqXhCVZetwhIpj8M/qsAaM4ULBwg
 Tq5O8UzvlpEHoGwFmPVuy6dQf6QQpGEHjZ0iRB73uJ8+Q6KdqTIab8qd1JDMFDOtrO
 tffak2EPDVfawG5iyRWbep76vhBXr97Hg7+sX+WGxjlQUPrIXoPzmb9s2SqlbNn7LF
 nAOA0HAwueC5EOUz4PzCqpeyo7vreHobwiEMhw+BgCwwmHEIcFYwyVM2HiLX5WykIp
 9HL0BZ6Eg1E4A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>,
 "arm@kernel.org" <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Alain Volmat <avolmat@me.com>
Subject: Re: [GIT PULL] STi DT update for v5.15 #1
Date: Thu, 12 Aug 2021 23:05:44 +0200
Message-ID: <162880206103.1376011.9460289595883893367.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1d95209f-9cb4-47a3-2696-7a93df7cdc05@foss.st.com>
References: <1d95209f-9cb4-47a3-2696-7a93df7cdc05@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140609_320198_A9647E81 
X-CRM114-Status: UNSURE (   7.68  )
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
Message-ID: <20210812210544.hWxg-OZdG1S72rtvhMMuJxQEQ_aKGw5oSp4d7E6HXYI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 6 Aug 2021 09:45:12 +0200, Patrice CHOTARD wrote:
> This STi DT update is dedicated for v5.15.
> It provides mainly clocks update and introduces a new board.
> 
> Thanks
> Patrice
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f3e22d32e4ddef2980ff9c9c401f7b948030e0be

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
