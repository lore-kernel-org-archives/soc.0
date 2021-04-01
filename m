Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEDFC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:24:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70214610D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70214610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n7XXw/D+zuV5MteAKz7b769i7Nkz5gWd9DWCiyOY65s=; b=XD/uk45ST30RlpwR2QWFZXz7i
	zF+RSY2raRi8OyhAb+UUfkJAehaKO/oEnW1AJsleL5V8jhvE34yKiT1gNybfTlQe9Umx9ws3n2zA+
	s8vZq1CnnzobLYhFEKLxmasLWv2XUHwuDvJ/4+lhlPSZ9xft3kp/Pgt2s0aKQdls2LbxBPSRhQsAL
	ftvGhVeOJ7o2xv66iNHsaYGzDOImVSgNQcg9yMyJmWmxLXQTYOrgQ5FpyDSSuDc6ZknVbUbucYE61
	pnphF6+b4RvyO5hZ/lGllfNzqoQ6xMLEeKdEJUroNKVzscGklLPqccQ+57NlRjfco3JmALSY0I8l6
	aMe4srnpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3ol-00Av5v-DT; Thu, 01 Apr 2021 20:21:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jW-00At7y-W3
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD15A610CF;
 Thu,  1 Apr 2021 20:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308161;
 bh=irZjzXGSZVMdspwKpGDAvHSi7OHxEhIejW09irlmSC4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aEmvPy4KT6p2zk0UkjDvqA9F1vcaIuZuHCq8Tnkn0A4WcjO69OX1ntF/41tKIDkoP
 8HbtShmVSbLLdwjZHiyLSI3w5LfItab/0YeGtYX8507a0hBbqUDh43CSuXOPXRptjy
 tKGSSJ4NowMjQq4m09cCZII6Xk2s/XFUUW253hlruflrQQEOSA04pSHP4n4V64Eqni
 okzcoDQqfZ8ESMt2rfzLFp7zgnCu0bYz71gxXph8u5hM7yGrq3nOYXsZVIxVPWvn+9
 3LDb+WlqWPENKkNaXACwLGaCqqwAY6HST9kOQ/Qo40LzP+vLShPwBUAnphNu9MAqQr
 f/plg4SCB2sTg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 1/5] dt-bindings: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 22:15:27 +0200
Message-ID: <161730808673.655497.15661315865375300905.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211610_060356_F31AA9DD 
X-CRM114-Status: UNSURE (   6.59  )
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
Message-ID: <20210401201527.zz5O7hUj3UE0FD8yf0A58ZtCfpRdLmud91g6NH8WKUo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:18 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-dt-bindings
> 
> [...]

Merged into arm/dt, thanks!

merge commit: ece61ed98bdab5c5ee28777cd5cb3113fe71bacf

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
