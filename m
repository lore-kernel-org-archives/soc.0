Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA52AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:47:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD352395C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD352395C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xRdQlsHWExQ1CT8oRed3XP6GKQ9amvEB9Ur5Wqae0gU=; b=wYbql8FEEKxqsuoGw6ZRHAboI
	4xpHax7Cs56jgE9CnRb74o0ZK1FJGPrmkmJFZBFGsn/u1BIoqmtp88LlYsLx3GpDxrH3TWtcLyBr2
	mEndfHDsE2yyqNYRqJI2cVIPP12mIrjRlnVz8cfpmALj9vu5dykIJRn5qAG+csSmFX86gu80klgjN
	QhSwdjFLj6c/6E2lDdCUP0JaiNY8ahYsbIk5DPpamaJWF2+thjwJPqagX/eAMLCtadQG83FpSCpc2
	lP9msQNhedM5BVSGdQNOqFjyHYDvjICM4MvMMpnMQ+3pPRQ1H0h+IuBFNBJs178Fv8XSk8fu3q9Ok
	3zTcyqthg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxpGW-0003wX-QF; Fri, 08 Jan 2021 10:45:08 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxpCG-0002oj-Bp
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:40:46 +0000
IronPort-SDR: EPZF6+pbxdu8MN0Vqr+PjjuuG3a7YmQAO70Lyhu1xGI6/TbzkocZSwFVOWJRL1UX/4P7PEfGie
 D9jEgl+Y/AVd6O6TKYbGjWpjYA7+ocDFxa0Bm/BVlCuY5TJqK/86mnVPnGkjlAGMs5YpIl6rtL
 e0LYFqZ8bkTH5goBQVlhhklDFjqLIi2ZMaEPgM4mQFcqFfm8s78ovltbzsGv+5is3lssdvMF5n
 KoSgkUKB1l7kDLZSOFvOMPJciNA60//ueE2zopHa+joHgYwiFxfECJDqlnA/DiplCxObW98YRM
 f5s=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14051033"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; d="scan'208";a="14051033"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa5.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E4F866
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:37 +0900 (JST)
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
 (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A8674A9A68
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:36 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
 (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
 by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id 9E601692764;
 Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:33 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 10/10] soc: fujitsu: hwb: Add Kconfig/Makefile to build
 fujitsu_hwb driver
Date: Fri, 8 Jan 2021 19:52:41 +0900
Message-ID: <20210108105241.1757799-11-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_054044_685630_321552AC 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: olof@lixom.net, catalin.marinas@arm.com, will@kernel.org,
 misono.tomohiro@jp.fujitsu.com, arnd@arndb.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108105241.7RCFpQZ5XS96INRgtddsLw_jRZOMmGaKmUJK7WYJSbI@z>

VGhpcyBhZGRzIGtjb25maWcvTWFrZWZpbGUgdG8gYnVpbGQgZnVqaXRzdSBoYXJkd2FyZSBiYXJy
aWVyIGRyaXZlcgooZnVqaXRzdV9od2Iua28gd2hlbiBidWlsdCBhcyBtb2R1bGUpLgoKTm90ZSB0
aGF0IHRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgdG8gYWRkIEE2NEZYIHNwZWNpZmljIGRyaXZlciwK
dGhpcyBhbHNvIGFkZHMgQTY0RlggZW50cnkgaW4gS2NvbmZpZy5wbGF0Zm9ybXMgb2YgYXJtNjQg
S2NvbmZpZy4KQWxzbyBhZGQgTUFJTlRBSU5FUlMgZW50cnkgZm9yIEFSTS9BNjRGWCBhY2NvcmRp
bmdseS4KClNpZ25lZC1vZmYtYnk6IE1pc29ubyBUb21vaGlybyA8bWlzb25vLnRvbW9oaXJvQGpw
LmZ1aml0c3UuY29tPgotLS0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgfCAgNyArKysr
KysrCiBhcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zIHwgIDUgKysrKysKIGRyaXZlcnMvc29j
L0tjb25maWcgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL3NvYy9NYWtlZmlsZSAgICAgICAgIHwg
IDEgKwogZHJpdmVycy9zb2MvZnVqaXRzdS9LY29uZmlnICB8IDI0ICsrKysrKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9zb2MvZnVqaXRzdS9NYWtlZmlsZSB8ICAyICsrCiA2IGZpbGVzIGNo
YW5nZWQsIDQwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9m
dWppdHN1L0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9mdWppdHN1L01h
a2VmaWxlCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA2ZWZm
NGY3MjBjNzIuLmQ1N2VjNDRjZWFlZCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJ
TlRBSU5FUlMKQEAgLTE1MDgsNiArMTUwOCwxMyBAQCBUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3NvYy9zb2MuZ2l0CiBGOglhcmNoL2FybS9tYWNo
LSovCiBGOglhcmNoL2FybS9wbGF0LSovCiAKK0FSTS9BNjRGWCBTT0MgU1VQUE9SVAorTToJVG9t
b2hpcm8gTWlzb25vIDxtaXNvbm8udG9tb2hpcm9AanAuZnVqaXRzdS5jb20+CitMOglsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmli
ZXJzKQorUzoJTWFpbnRhaW5lZAorRjoJZHJpdmVycy9zb2MvZnVqaXRzdS8KK0Y6CWluY2x1ZGUv
dWFwaS9saW51eC9mdWppdHN1X2hwY19pb2N0bC5oCisKIEFSTS9BQ1RJT05TIFNFTUkgQVJDSElU
RUNUVVJFCiBNOglBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+CiBNOglNYW5pdmFu
bmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyBiL2FyY2gvYXJtNjQvS2NvbmZpZy5w
bGF0Zm9ybXMKaW5kZXggNmVlY2RlZjUzOGJkLi40MWZiMjE0YWRhZmYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMKKysrIGIvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRm
b3JtcwpAQCAtMSw2ICsxLDExIEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKIG1lbnUgIlBsYXRmb3JtIHNlbGVjdGlvbiIKIAorY29uZmlnIEFSQ0hfQTY0RlgKKwli
b29sICJGdWppdHN1IEE2NEZYIFBsYXRmb3JtcyIKKwloZWxwCisJICBUaGlzIGVuYWJsZXMgc3Vw
cG9ydCBmb3IgRnVqaXRzdSBBNjRGWCBTb0MgZmFtaWx5LgorCiBjb25maWcgQVJDSF9BQ1RJT05T
CiAJYm9vbCAiQWN0aW9ucyBTZW1pIFBsYXRmb3JtcyIKIAlzZWxlY3QgT1dMX1RJTUVSCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9LY29uZmlnIGIvZHJpdmVycy9zb2MvS2NvbmZpZwppbmRleCBk
MDk3ZDA3MGY1NzkuLjdhNTJiNWRjNGM5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zb2MvS2NvbmZp
ZworKysgYi9kcml2ZXJzL3NvYy9LY29uZmlnCkBAIC03LDYgKzcsNyBAQCBzb3VyY2UgImRyaXZl
cnMvc29jL2FzcGVlZC9LY29uZmlnIgogc291cmNlICJkcml2ZXJzL3NvYy9hdG1lbC9LY29uZmln
Igogc291cmNlICJkcml2ZXJzL3NvYy9iY20vS2NvbmZpZyIKIHNvdXJjZSAiZHJpdmVycy9zb2Mv
ZnNsL0tjb25maWciCitzb3VyY2UgImRyaXZlcnMvc29jL2Z1aml0c3UvS2NvbmZpZyIKIHNvdXJj
ZSAiZHJpdmVycy9zb2MvaW14L0tjb25maWciCiBzb3VyY2UgImRyaXZlcnMvc29jL2l4cDR4eC9L
Y29uZmlnIgogc291cmNlICJkcml2ZXJzL3NvYy9saXRleC9LY29uZmlnIgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvTWFrZWZpbGUgYi9kcml2ZXJzL3NvYy9NYWtlZmlsZQppbmRleCA2OTliNzU4
ZDI4ZTQuLjU3YzBkZGRjNGQyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zb2MvTWFrZWZpbGUKKysr
IGIvZHJpdmVycy9zb2MvTWFrZWZpbGUKQEAgLTEwLDYgKzEwLDcgQEAgb2JqLXkJCQkJKz0gYmNt
Lwogb2JqLSQoQ09ORklHX0FSQ0hfRE9WRSkJCSs9IGRvdmUvCiBvYmotJChDT05GSUdfTUFDSF9E
T1ZFKQkJKz0gZG92ZS8KIG9iai15CQkJCSs9IGZzbC8KK29iai15CQkJCSs9IGZ1aml0c3UvCiBv
YmotJChDT05GSUdfQVJDSF9HRU1JTkkpCSs9IGdlbWluaS8KIG9iai15CQkJCSs9IGlteC8KIG9i
ai0kKENPTkZJR19BUkNIX0lYUDRYWCkJKz0gaXhwNHh4LwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
b2MvZnVqaXRzdS9LY29uZmlnIGIvZHJpdmVycy9zb2MvZnVqaXRzdS9LY29uZmlnCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uY2JiYTBjOTM5ZTYyCi0tLSAvZGV2L251
bGwKKysrIGIvZHJpdmVycy9zb2MvZnVqaXRzdS9LY29uZmlnCkBAIC0wLDAgKzEsMjQgQEAKKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQorIworIyBGVUpJVFNVIFNvQyBk
cml2ZXJzCisjCittZW51Y29uZmlnIFNPQ19GVUpJVFNVCisJYm9vbCAiRlVKSVRTVSBTb0MgZHJp
dmVycyIKKwlkZXBlbmRzIG9uIEFSQ0hfQTY0RlggfHwgQ09NUElMRV9URVNUCisKK2lmIFNPQ19G
VUpJVFNVCisKK2NvbmZpZyBGVUpJVFNVX0hBUkRXQVJFX0JBUlJJRVIKKwl0cmlzdGF0ZSAiRlVK
SVRTVSBIUEMgSGFyZHdhcmUgQmFycmllciBEcml2ZXIiCisJZGVwZW5kcyBvbiBBUk02NF9WSEUg
fHwgQ09NUElMRV9URVNUCisJaGVscAorCSAgRlVKSVRTVSBIUEMgSGFyZHdhcmUgQmFycmllciBE
cml2ZXIKKworCSAgVGhpcyBkcml2ZXIgb2ZmZXJzIGhhcmR3YXJlIGJhcnJpZXIgZnVuY3Rpb25z
IGZvciBBNjRGWCBzeXN0ZW0KKwkgIHdoaWNoIHJlYWxpemVzIHN5bmNocm9uaXphdGlvbiBieSBQ
RXMgaW4gdGhlIHNhbWUgQ01HIChMMyBjYWNoZQorCSAgZG9tYWluKSBieSB1c2luZyBpbXBsZW1l
bnRhdGlvbiBkZWZpbmVkIHJlZ2lzdGVycy4gQXMgY29udHJvbAorCSAgcmVnaXN0ZXJzIGNhbiBv
bmx5IGJlIGFjY2Vzc2VkIGZyb20gRUwyIG9uIHJlc2V0LCB0aGlzIGRyaXZlcgorCSAgbmVlZHMg
c3VwcG9ydCBvZiBWSEUuCisJICBXaGVuIGJ1aWx0IGFzIGEgbW9kdWxlLCB0aGlzIHdpbGwgYmUg
Y2FsbGVkIGFzICJmdWppdHN1X2h3YiIuCisKK2VuZGlmICMgU09DX0ZVSklUU1UKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc29jL2Z1aml0c3UvTWFrZWZpbGUgYi9kcml2ZXJzL3NvYy9mdWppdHN1L01h
a2VmaWxlCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMWI4ZTRjOTQ3
ZjdmCi0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9zb2MvZnVqaXRzdS9NYWtlZmlsZQpAQCAt
MCwwICsxLDIgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKK29iai0kKENP
TkZJR19GVUpJVFNVX0hBUkRXQVJFX0JBUlJJRVIpICs9CWZ1aml0c3VfaHdiLm8KLS0gCjIuMjYu
MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwK
