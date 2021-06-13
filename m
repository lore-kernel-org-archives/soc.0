Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E680DC48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:27:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA30E61042
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA30E61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVtqQhUZ7Es5edmStiWilpj7DOdHgIXJHeaiwt4Dg18=; b=wLtiLt/YOPIy/r
	WyXJtvjVEIlaFKuJ6/T9IeR8NaJ/hquJ3ixJaQoelJz1eWNFNDHFk/Z6Q2P10mFrRvPv24/WY40Bq
	71TYS4mqUbsXcGOFfFiVjeBtqCb/2lblqagb6BoHnvYH/bM+BS7w8yFvOszU0A4FIO/AhEoD7l+SU
	2ysxSXvgVhOr6NarFdaWOSUi6tMvH6Vvz6pfEFtBKd2HGGwKIORJUr4a8BFlF2PL00BmZLJZ4NO9v
	AAwGrifRBafjzGS2q3Hay+HzjnPm3cMtnqjqzylsnmE9yqDhx5fFGAptcnCqrhOuVTj/aOCpszRHn
	oUq2+8nJkkxW4SaFaULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsLRc-009wQu-EF; Sun, 13 Jun 2021 08:26:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsLRQ-009wOX-71
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 08:26:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32AA06108D;
 Sun, 13 Jun 2021 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623572760;
 bh=wgVmKZtvUaEb+eyfGekTv3BJ91tsf33aH/xpOr0h88Q=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OI9l+9Risxyr2d3nYy/yXNipznTSwyVK+tC84zejucqnoOAhMHplzdkfdAzMTCR99
 oUqm79XUgZFKrTtkOCng0RwrKtJXB3liXbAVVs63773+rlq4NnK0zdEzb9+G3yA1Kq
 AZT0Doo9TdiVV7ubr1MkOVvOVo3mYl/X1gqm8bjlVSprIUTrL9+tMiww8B5kyKpEgE
 EbaCIPQvFOXkoHNqpyQ4jz6JcWXxX7DVmiPDhH2q77hU3g6ctpThxztaKiGST66N0Q
 FVeDFxmsC7c5KQG3b9jXCt41xbHMoLolGid0U/mQBF6tSFonafgAQOgycwdsI5yW5R
 ZZmcGuS4UO4+A==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX SoC changes for 5.14
Date: Sun, 13 Jun 2021 16:25:40 +0800
Message-ID: <20210613082544.16067-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_012600_291164_C605207B 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210613082540.rm_4z-qL8LrC4oams-pPR3A8uCPa5sNXH8Dd8mhK7fw@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ZWZiOTQzYjg2MTZlYzUzYTVlNDQ0
MTkzZGNjZjFhZjlhZDYyN2I1OgoKICBMaW51eCA1LjEzLXJjMSAoMjAyMS0wNS0wOSAxNDoxNzo0
NCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXgu
Z2l0IHRhZ3MvaW14LXNvYy01LjE0Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZTM0
NjQ1ZjQ1ODA1ZDgzMDg4NjZkZTdiNjlmMTE3ZjU1NDYwNWJiNjoKCiAgQVJNOiBpbXg6IGFkZCBz
bXAgc3VwcG9ydCBmb3IgaW14N2QgKDIwMjEtMDYtMTIgMTI6MDI6NTcgKzA4MDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CmkuTVggU29DIGNoYW5nZXMgZm9yIDUuMTQ6CgotIEFkZCBTTVAgc3VwcG9ydCBmb3IgaS5NWDdE
LCBhcyB0aGVyZSBhcmUgaS5NWDdEIGRldmljZXMgcnVubmluZyBpbgogIGZpZWxkIHdpdGggVS1C
b290IHRoYXQgZG9lc24ndCBzdXBwb3J0IFBTQ0kuCi0gRml4IGlteDVfY3B1X3N1c3BlbmRfaW5m
byByZWZlcmVuY2UgaW4gaS5NWDUgUE0gY29kZSBjb21tZW50cy4KLSBBZGQgU29DIElEIGluaXRp
YWxpemF0aW9uIGZvciBpLk1YNTAuCi0gRHJvcCB1bm5lY2Vzc2FyeSBvZl9wbGF0Zm9ybV9kZWZh
dWx0X3BvcHVsYXRlKCkgY2FsbCBmcm9tIGkuTVg2UQogIC5pbml0X21hY2hpbmUgaG9vay4KLSBB
IHNlcmllcyBmcm9tIE9sZWtzaWogUmVtcGVsIHRvIHJlbW92ZSBtb3N0IG9mIHRoZSBpLk1YNi83
IGJvYXJkCiAgc3BlY2lmaWMgUEhZIGZpeHVwcy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQW5zb24gSHVhbmcgKDEpOgog
ICAgICBBUk06IGlteDogYWRkIHNtcCBzdXBwb3J0IGZvciBpbXg3ZAoKSm9uYXRoYW4gTmV1c2No
w6RmZXIgKDIpOgogICAgICBBUk06IGlteDogcG0taW14NTogRml4IHJlZmVyZW5jZXMgdG8gaW14
NV9jcHVfc3VzcGVuZF9pbmZvCiAgICAgIEFSTTogaW14OiBJbml0aWFsaXplIFNvQyBJRCBvbiBp
Lk1YNTAKCk1hcmNvIEZlbHNjaCAoMSk6CiAgICAgIEFSTTogaW14NnE6IGRyb3Agb2ZfcGxhdGZv
cm1fZGVmYXVsdF9wb3B1bGF0ZSgpIGZyb20gaW5pdF9tYWNoaW5lCgpPbGVrc2lqIFJlbXBlbCAo
Nyk6CiAgICAgIEFSTTogaW14NnE6IHJlbW92ZSBQSFkgZml4dXAgZm9yIEtTWjkwMzEKICAgICAg
QVJNOiBpbXg2cTogcmVtb3ZlIHBhcnQgb2YgYXI4MDMxX3BoeV9maXh1cCgpCiAgICAgIEFSTTog
aW14NnE6IHJlbW92ZSBCTUNSX1BET1dOIGhhbmRsZXIgaW4gYXI4MDM1X3BoeV9maXh1cCgpCiAg
ICAgIEFSTTogaW14NnE6IHJlbW92ZSBjbGstb3V0IGZpeHVwIGZvciB0aGUgQXRoZXJvcyBBUjgw
MzEgYW5kIEFSODAzNSBQSFlzCiAgICAgIEFSTTogaW14NnE6IHJlbW92ZSBBdGhlcm9zIEFSODAz
NSBTbWFydEVFRSBmaXh1cAogICAgICBBUk06IGlteDZzeDogcmVtb3ZlIEF0aGVyb3MgQVI4MDMx
IFBIWSBmaXh1cAogICAgICBBUk06IGlteDdkOiByZW1vdmUgQXRoZXJvcyBBUjgwMzEgUEhZIGZp
eHVwCgogYXJjaC9hcm0vbWFjaC1pbXgvTWFrZWZpbGUgICAgICAgIHwgICAyICstCiBhcmNoL2Fy
bS9tYWNoLWlteC9jb21tb24uaCAgICAgICAgfCAgIDMgKysKIGFyY2gvYXJtL21hY2gtaW14L2hl
YWRzbXAuUyAgICAgICB8ICAgOSArKysrCiBhcmNoL2FybS9tYWNoLWlteC9ob3RwbHVnLmMgICAg
ICAgfCAgIDMgKysKIGFyY2gvYXJtL21hY2gtaW14L21hY2gtaW14NTAuYyAgICB8ICAgNyArKysK
IGFyY2gvYXJtL21hY2gtaW14L21hY2gtaW14NnEuYyAgICB8ICA4OCAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtL21hY2gtaW14L21hY2gtaW14NnN4LmMgICB8ICAy
NiAtLS0tLS0tLS0tCiBhcmNoL2FybS9tYWNoLWlteC9tYWNoLWlteDdkLmMgICAgfCAgMjUgKy0t
LS0tLS0tLQogYXJjaC9hcm0vbWFjaC1pbXgvcGxhdHNtcC5jICAgICAgIHwgIDI2ICsrKysrKysr
KysKIGFyY2gvYXJtL21hY2gtaW14L3NyYy5jICAgICAgICAgICB8IDEwMSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLQogYXJjaC9hcm0vbWFjaC1pbXgvc3VzcGVuZC1pbXg1
My5TIHwgICA0ICstCiBkcml2ZXJzL3NvYy9pbXgvc29jLWlteC5jICAgICAgICAgfCAgIDMgKysK
IGluY2x1ZGUvc29jL2lteC9jcHUuaCAgICAgICAgICAgICB8ICAgMSArCiAxMyBmaWxlcyBjaGFu
Z2VkLCAxNDkgaW5zZXJ0aW9ucygrKSwgMTQ5IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5n
IGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
