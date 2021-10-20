Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1B6C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:04:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2645C60FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2645C60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZU8e6yTzKRdQajWHtrrWW83ITQ+C7JDIR2VBOaGBa0=; b=MnSzrY96tZZRt/
	pE/6H8DuU72atfgDKzALQz1apG4AvUTeeQcpevSORMw/z4uuT2fR97TeoEu9Ij3kdK/9jE1ZJTyf5
	r2bjpX9qd/fLUisADtX+zogA6YBOsiQZwbx5RTJOTOa/WNwtTAMqcUz+nF9VpYIIs7BJRVtIxFsjw
	rLVu1eK6CmuWWyR0NbwNAEZzO6Zta1uwXRIrBftgu+WVG6JBH04k0y8PtVWPsYPNLiLt7ZtDR3Yvw
	L98ryuTeSYZKEQOOHQqV6IeE/kFJUZq6QnCt7ZvA/yagynS4y9RGYek9pl5dBp5djUntrYThy/j8h
	u+UH7vqPN6iRh9EpO+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdD6G-004sqg-Ga; Wed, 20 Oct 2021 15:01:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvQ-004q19-3R
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E19176137C;
 Wed, 20 Oct 2021 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741439;
 bh=OoyZp+OyuybYtUVOajvIwZlh0dSL8n5F2waTo6cWpsU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JOKyVpyKQM17DHSIhvBFJCRDK/g2dZtz2Wkb/4OFIbEvEpaTfzKUVAcOiGn1gf+EQ
 XCDkXScxBElZY5rxSIskGJBgUjJsVE2Mq9hyz5fSG6e0nj9mwJ1ovLqnKhLUdLNc7Q
 9kkU5imSfwMPgavT/U0YTNMpUbQqAlyM0bTDouwdYFwHcIASIr+FBQY0WfFs9s8N9E
 GKOZZqCQ/DPMvyRFs4vlGopEJstOTHTgoBnAl8KN0niBCm7IcS5RGwg7oMEOKdop0L
 8jiEsHaiGZBdDGrRacoSjO+ygwEE8FmPaxxTIGPBXNB+9UeWah7Yp974yiKx9woWXw
 btQTTwEjQktSA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, soc@kernel.org,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] ARM: dts: samsung: dts for v5.16
Date: Wed, 20 Oct 2021 16:50:13 +0200
Message-ID: <163474139765.4099414.3378403941949760165.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
References: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075040_211007_6D3A7168 
X-CRM114-Status: UNSURE (   7.16  )
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
Message-ID: <20211020145013.HsZsm7Kqz3LyDCGmrigPx3e3QYGwmBLOSY5Vf-s73nU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 18:24:17 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 54dd38340d762620c216d15388b8b3b32f47b6f7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
