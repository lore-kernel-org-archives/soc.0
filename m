Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15398C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:14:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B785822203
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B785822203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xCjj3LDAqssyjzjdadP4KJhy8BadBTVlaoyxMZwGMgE=; b=t5aQ/SD9c9ojRt0rm2EMfSjI+
	B48kMPSzEy3zk6zSZgiRaNoUpmlZiZFqMwZ/WMmmtG7WJ/yTdppo7pdTSE5R5yGwKHV2A0rdH4vKm
	iZywUxh5oAZnuqMiNGUmvxBMpnTEBhBuvcNTzvIt6SAVeZlbGzOJUq9r7vgGaoNWItASFKXgOmq5h
	OkyJ0BqH8gJCsHR3TFuUu9e3RBrkUSnFTCDxD3yb+wwnj/A1DQVNhrbVeSrTLMQmzWGfcvlrcbZ1T
	H2p5sJsaEgjZmsAENo0TEEZKc7tddJNy5LV25DTVDEs651L28cbyo1Jl29eBWQeNeJkB8IiNff62I
	VDM3O/X3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmAk-00074x-RX; Tue, 08 Dec 2020 23:13:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm8Q-0005kC-7I
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:11:07 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
Subject: Re: [GIT PULL] arm64: TI K3 DT updates for v5.11
Date: Wed,  9 Dec 2020 00:09:52 +0100
Message-ID: <160746884594.2839681.8722391797476584584.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130174258.ljsiokkyr7x7tsbd@covenant>
References: <20201130174258.ljsiokkyr7x7tsbd@covenant>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181106_383054_FFB34B13 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: t-kristo@ti.com, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230952.ZNuwmokfJa5WTB_rjJltODVFj45kBLQeSMtnudrHJww@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 11:42:58 -0600, Nishanth Menon wrote:
> Please pull the following for TI K3 dts changes for v5.11 window.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e40917e4664e490d5f5b7a4cbd83ee9f46d27113

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
