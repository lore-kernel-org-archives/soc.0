Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F2BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F35760F59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F35760F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STn1tcsXytqdp/XCNZpSBOUOzoVuveAvYx8M/MG1sf8=; b=TEvOy6YYHzFcYv
	l7M+74QsiNDGba+MzDbhgfiWkj23T6We+5nJbsMdolOuo53vAw6mEFl+YIJcMKrUuQbWz746P69aH
	9nsYpeLSXUOo56SR54MqKCkA3FuuZpeGdhDERVpD0Rj+KO0dY07KRbJAZy8akfBLvbrza/EG45/gH
	alKAlgiLoKqcKH0tG9MhZzx4HsiagLyD3r/cZHf09CKNN8Fzh+65G6+YonNC8KTTW8ekkL7Eb3Qn9
	NtaBc1I8JSq/2Ug/GdAAPJvD3m5NHXZEuQotdPFXGFwCAzlCPQw/bGgxtEqhM64dP1ieVI1YLS27Z
	ci+dNsdGgyYw6yIqcneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJAl-005rh6-GO; Wed, 20 Oct 2021 21:30:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJAZ-005rex-8F
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:30:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB59D61284;
 Wed, 20 Oct 2021 21:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634765442;
 bh=+di8/CKCwnYc9P6WoxftUMkSrSNJKw1OrByoQVD7PBI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U/sa0ZDjRPAbFdwDxt1siRKm9Kqm9m6XVWw5Ux2zrd5jCNAz5cgl9u/ACCeT6TCGE
 q8AikMcXbK89ddId63Iu0BS/3rjZ1kDG0af2JCDNF47AAPLccYD3HLErKd+iT0i6yK
 af+bOUHvtEKofwysdL+RmnmSgTRRGzrhLktVhPIRlFVlqxPshXRhbwT68huwZMeem8
 5+U00MxWckyHINSyBOgjw+ZEI2tolvEmqOEBvfGUCDNQ1o2mCZxO5F2IMhgAZkG1ts
 4fnw94zBYtrXJR8vpiONAeOusPhPyqHmByw/3rdJr3Idv7V6tlDnHJOOylM486N44G
 QB4HiBNmGRoEg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, olof@lixom.net,
 soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 yuji2.ishikawa@toshiba.co.jp
Subject: Re: [GIT PULL] ARM: Visconti: defconfig changes for 5.16
Date: Wed, 20 Oct 2021 23:30:36 +0200
Message-ID: <163476542780.4156336.10346978324196950813.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YWoIf4xPoQtLhC3x@toshiba.co.jp>
References: <YWoIf4xPoQtLhC3x@toshiba.co.jp>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_143043_333035_923D7F31 
X-CRM114-Status: UNSURE (   7.79  )
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
Message-ID: <20211020213036.E9QtLxgQPy1l6YrE5YCz3tTwAOapUXSPUtHmRMzn5Ks@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 08:02:23 +0900, Nobuhiro Iwamatsu wrote:
> This request includes patches that enables PCIe for Visconti SoC in defconfig.
> Please pull for v5.16 kernel cycle.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: ddcb48fa7d60bae6c3f2db7cc84250d33177388d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
