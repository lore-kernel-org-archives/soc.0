Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAC4C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:51:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C14761132
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C14761132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rDANDVX/Q0qaEFyapHySS8Vr4zQ163cJ18pl5d94p3M=; b=NNKMsDebRGmkMqQrfG4WoXFRl
	AnC+zFmEyKrPhjensh8lB/3YLb7Gp0KDCzZIVAHiMH8sgc2n7iIEXNt1gOHakSHLfsFUyGe70Iy6S
	eqsG0fUaGg4gzpg8XXIlRYZMiYnTCWJfVPdqTv6D8KSfXBAEgQJt85IfaKJCQ4K1Xj/jdALHvuH68
	Rhnm1Rh/mxE41dqny/8L49UmmceBp+XcGJ9eWB7UXa4pPwNz/NGDVl0dzyxOPfWInmwfgr7MUTADr
	MMk+9I/F2fz9QsGZViGOgIUtAQNtJ+GOpcJzGY/KUUB/i4zmZcF/vX/N6VgR9Cmx5c2B01u+qGOWJ
	msP8WhHUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWuv-008VAj-Dq; Thu, 08 Apr 2021 15:50:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWue-008V2n-UC
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:49:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D8EA61155;
 Thu,  8 Apr 2021 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617896983;
 bh=wsrGaq7lMt1D1s+OTUqLNmpDcaeia7PVJYghnE8512s=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CRuMnUokn+6/ij/dzppQWiotI1E9ZMJrUDbc8lG7C3+E61/C1p6UIDH5FZs8Z6ufq
 Z+1CTxviLxwLeGtygFr8Qqxp6CNg60B09f530H9iO/X2kLD0t3AaW4349XUfVaEiMD
 0ytNB3qr9ZTm6H+G83J/YUcj8smcWmtt2EzbHu8lhLUaoW0cYoMMrlGQo6Q+WaplEc
 ARPmHquG0511z/MI5/u6X0DTNC5/4mKp6/7KRoaTFSX712h2AgL8I63gr1UlrwziH5
 ThfQ1ymWHS/3+dz/3vJPDVGr7vbcTLU9CQE/zczaf3r221jbYLBByDqLrl+C6KWpCJ
 WpvOe5E6AYMSA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] SoCFPGA firmware update for v5.13
Date: Thu,  8 Apr 2021 17:49:28 +0200
Message-ID: <161789693296.1636044.15606458085850254179.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210405155026.86309-1-dinguyen@kernel.org>
References: <20210405155026.86309-1-dinguyen@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_164946_312130_B5FD48A0 
X-CRM114-Status: UNSURE (   7.44  )
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
Message-ID: <20210408154928.Utg23Vsdi_KrJ04QyXPh-RUxH6Jz7n1TQtWKxnYlxaw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 5 Apr 2021 10:50:26 -0500, Dinh Nguyen wrote:
> Please pull in this patch for v5.13.
> 
> Thanks,
> Dinh
> 
> The following changes since commit 4483397b03536506535d611b0cb28a81a69e8edf:
> 
>   ARM: socfpga: drop ARCH_SOCFPGA (2021-03-23 11:03:36 -0500)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 0ffc253e2e0ea7b0a1a6b73f019ba38dfe7a3e44

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
