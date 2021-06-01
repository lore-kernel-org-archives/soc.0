Return-Path: <SRS0=hZ7m=K3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD39BC47080
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 10:04:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760A66136E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 10:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760A66136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1UltMeW0QIkndQIB/n39doDbGkkMIne+VN8ORJM49c=; b=z8BI1tt+ypAQVb
	HNBmqICGbEAisHbxg+MRMAMRwAlj5uaLFkrdopMHQ0EZUcYYW79Wl+F79/wO6BzE2FUEw3InE0eo5
	oKrVMZMb1wZ5LaHkjDk8aKpvumS2JDSm5r4PppxLgNiZv9hdiJir97i9Na+QYfR0eUsrhpVZreqAl
	yoAYbcmMlofRJ05ZGHqYbqECIMDGakJ8Wo6AoGDwn/FsFJuU6DkYu/+x0cNtNzuYEglxrxkCgAQZt
	NTt4g/a5T0Y/SvkSBNuIS6Ss+VkwQK2Z+4dG5vaUzLPgjIV61Ml2BRZKA9+VvD0DZEpf2Q7X4T0NX
	X5rFeIZRtshBCm6uSjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo1Ez-00FmNo-Az; Tue, 01 Jun 2021 10:03:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo1Eu-00FmMq-Uy; Tue, 01 Jun 2021 10:03:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 274BD6136E;
 Tue,  1 Jun 2021 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622541792;
 bh=0jRus9vAu2IKxyB4L0YFCgNgnJE8tYA0twVfow3cZLY=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=dYutvFXC05lIVPcV9fZpe5SSyzFnai6xlfSVoeuplbYGGIAqdpRdCHJliDUWLF6wB
 LW/f8mB2MaW5Frq7hqtYDVceXU6cuGiCnF+B0a+wIbbhcCeQnCiDbOpCkRFbUwCzBH
 OIilzuUt31V291ewa7jwBh0R02PRPlHhRr8oAUPvIlb73aD+k6udif9lAYl7HYJeay
 p9A83sKyHQWWP+tAByYhNbx7fm4jEXKQBOJa7j8OB91eB0oJQ3OeHRenCHvOYCgag/
 1tMYgQl5ZshPAZjP8covbxntLDjIDt7g8T90zp4fyRuV0bQ2OTJpxOR8laFyN/jpqy
 dhx5ehvo24zug==
Message-ID: <86a7cded6e3e17b0ab347e55b38a44e10bc4e46a.camel@kernel.org>
Subject: Re: [PATCH 3/6] ARM: dts: Move BCM2711 RPi specific into separate dtsi
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Tue, 01 Jun 2021 12:03:07 +0200
In-Reply-To: <1622366775-5309-4-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-4-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_030313_063071_F5A2F7A8 
X-CRM114-Status: GOOD (  22.97  )
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
Message-ID: <20210601100307.l2t9RxNy5iP7dLf9xKbjAc3ifAmnXLiJzRjRO6p5Nso@z>

SGkgU3RlZmFuLApUaGFua3MgZm9yIGhhdmluZyBhIGdvIGF0IHRoaXMuCgpPbiBTdW4sIDIwMjEt
MDUtMzAgYXQgMTE6MjYgKzAyMDAsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6Cj4gVGhlcmUgaXMgYSBs
b3Qgb2YgUmFzcGJlcnJ5IFBpIHNwZWNpZmljIHN0dWZmIChuZWl0aGVyIFNvQyBvciBib2FyZAo+
IHNwZWNpZmljKSBmb3IgdGhlIEJDTTI3MTEgd2hpY2ggaXMgY3VycmVudGx5IGluIHRoZSBSUGkg
NCBCIGR0cy4gSW4gb3JkZXIKPiB0byBhdm9pZCBjb3B5ICYgcGFzdGUgZm9yIGV2ZXJ5IG5ldyBC
Q00yNzExIGJhc2VkIFJhc3BiZXJyeSBQaSwgbW92ZSBpdAo+IGludG8gYSBzZXBhcmF0ZSBkdHNp
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBXYWhyZW4gPHN0ZWZhbi53YWhyZW5AaTJzZS5j
b20+Cj4gLS0tCj4gwqBhcmNoL2FybS9ib290L2R0cy9iY20yNzExLXJwaS00LWIuZHRzIHwgNjIg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTI3
MTEtcnBpLmR0c2kgICAgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
IMKgMiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkKPiDC
oGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9iY20yNzExLXJwaS5kdHNpCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI3MTEtcnBpLTQtYi5kdHMgYi9h
cmNoL2FybS9ib290L2R0cy9iY20yNzExLXJwaS00LWIuZHRzCj4gaW5kZXggM2I0YWI5NC4uNzgx
NDJhMCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9iY20yNzExLXJwaS00LWIuZHRz
Cj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYmNtMjcxMS1ycGktNC1iLmR0cwo+IEBAIC0xLDEx
ICsxLDkgQEAKPiDCoC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gwqAvZHRz
LXYxLzsKPiDCoCNpbmNsdWRlICJiY20yNzExLmR0c2kiCj4gLSNpbmNsdWRlICJiY20yODM1LXJw
aS5kdHNpIgo+ICsjaW5jbHVkZSAiYmNtMjcxMS1ycGkuZHRzaSIKPiDCoCNpbmNsdWRlICJiY20y
ODN4LXJwaS11c2ItcGVyaXBoZXJhbC5kdHNpIgo+IMKgCj4gCj4gLSNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9yZXNldC9yYXNwYmVycnlwaSxmaXJtd2FyZS1yZXNldC5oPgo+IC0KPiDCoC8gewo+IMKg
CWNvbXBhdGlibGUgPSAicmFzcGJlcnJ5cGksNC1tb2RlbC1iIiwgImJyY20sYmNtMjcxMSI7Cj4g
wqAJbW9kZWwgPSAiUmFzcGJlcnJ5IFBpIDQgTW9kZWwgQiI7Cj4gQEAgLTIyLDEwICsyMCw3IEBA
Cj4gwqAJfTsKPiDCoAo+IAo+IMKgCWFsaWFzZXMgewo+IC0JCWVtbWMyYnVzID0gJmVtbWMyYnVz
Owo+IMKgCQlldGhlcm5ldDAgPSAmZ2VuZXQ7CgpXaHkgbm90IHBpY2tpbmcgdGhpcyBvbmU/IG5v
ciB0aGUgcmVsZXZhbnQgRFQgbm9kZXM/IEkgYmVsaXZlIGl0J3MgYXZhaWxhYmxlIG9uCmFsbCB0
aGUgYmNtMjcxMSBiYXNlZCBib2FyZHMuCgo+IC0JCXBjaWUwID0gJnBjaWUwOwo+IC0JCWJsY29u
ZmlnID0gJmJsY29uZmlnOwo+IMKgCX07Cj4gwqAKPiAKPiDCoAlsZWRzIHsKPiBAQCAtODAsMTEg
Kzc1LDYgQEAKPiDCoH07Cj4gwqAKPiAKPiDCoCZmaXJtd2FyZSB7Cj4gLQlmaXJtd2FyZV9jbG9j
a3M6IGNsb2NrcyB7Cj4gLQkJY29tcGF0aWJsZSA9ICJyYXNwYmVycnlwaSxmaXJtd2FyZS1jbG9j
a3MiOwo+IC0JCSNjbG9jay1jZWxscyA9IDwxPjsKPiAtCX07Cj4gLQo+IMKgCWV4cGdwaW86IGdw
aW8gewoKV2h5IG5vdCB0YWtpbmcgdGhpcyBvbmUgdG9vIGFuZCBsZXR0aW5nIGVhY2ggZHRzIGZp
bGUgZGVmaW5lIGl0cyBvd24KJ2dwaW8tbGluZS1uYW1lcyc/Cgo+IMKgCQljb21wYXRpYmxlID0g
InJhc3BiZXJyeXBpLGZpcm13YXJlLWdwaW8iOwo+IMKgCQlncGlvLWNvbnRyb2xsZXI7Cj4gQEAg
LTk5LDExICs4OSw2IEBACj4gwqAJCQkJICAiIjsKPiDCoAkJc3RhdHVzID0gIm9rYXkiOwo+IMKg
CX07Cj4gLQo+IC0JcmVzZXQ6IHJlc2V0IHsKPiAtCQljb21wYXRpYmxlID0gInJhc3BiZXJyeXBp
LGZpcm13YXJlLXJlc2V0IjsKPiAtCQkjcmVzZXQtY2VsbHMgPSA8MT47Cj4gLQl9Owo+IMKgfTsK
PiDCoAo+IAo+IMKgJmdwaW8gewo+IEBAIC0xODAsMjMgKzE2NSwxMyBAQAo+IMKgfTsKPiDCoAo+
IAo+IMKgJmhkbWkwIHsKPiAtCWNsb2NrcyA9IDwmZmlybXdhcmVfY2xvY2tzIDEzPiwgPCZmaXJt
d2FyZV9jbG9ja3MgMTQ+LCA8JmR2cCAwPiwgPCZjbGtfMjdNSHo+Owo+IC0JY2xvY2stbmFtZXMg
PSAiaGRtaSIsICJidmIiLCAiYXVkaW8iLCAiY2VjIjsKPiAtCXdpZmktMi40Z2h6LWNvZXhpc3Rl
bmNlOwo+IMKgCXN0YXR1cyA9ICJva2F5IjsKPiDCoH07Cj4gwqAKPiAKPiDCoCZoZG1pMSB7Cj4g
LQljbG9ja3MgPSA8JmZpcm13YXJlX2Nsb2NrcyAxMz4sIDwmZmlybXdhcmVfY2xvY2tzIDE0Piwg
PCZkdnAgMT4sIDwmY2xrXzI3TUh6PjsKPiAtCWNsb2NrLW5hbWVzID0gImhkbWkiLCAiYnZiIiwg
ImF1ZGlvIiwgImNlYyI7Cj4gLQl3aWZpLTIuNGdoei1jb2V4aXN0ZW5jZTsKPiDCoAlzdGF0dXMg
PSAib2theSI7Cj4gwqB9Owo+IMKgCj4gCj4gLSZodnMgewo+IC0JY2xvY2tzID0gPCZmaXJtd2Fy
ZV9jbG9ja3MgND47Cj4gLX07Cj4gLQo+IMKgJnBpeGVsdmFsdmUwIHsKPiDCoAlzdGF0dXMgPSAi
b2theSI7Cj4gwqB9Owo+IEBAIC0yMTksMjIgKzE5NCw2IEBACj4gwqAJc3RhdHVzID0gIm9rYXki
Owo+IMKgfTsKPiDCoAo+IAo+IC0mcm1lbSB7Cj4gLQkvKgo+IC0JICogUlBpNCdzIGNvLXByb2Nl
c3NvciB3aWxsIGNvcHkgdGhlIGJvYXJkJ3MgYm9vdGxvYWRlciBjb25maWd1cmF0aW9uCj4gLQkg
KiBpbnRvIG1lbW9yeSBmb3IgdGhlIE9TIHRvIGNvbnN1bWUuIEl0J2xsIGFsc28gdXBkYXRlIHRo
aXMgbm9kZSB3aXRoCj4gLQkgKiBpdHMgcGxhY2VtZW50IGluZm9ybWF0aW9uLgo+IC0JICovCj4g
LQlibGNvbmZpZzogbnZyYW1AMCB7Cj4gLQkJY29tcGF0aWJsZSA9ICJyYXNwYmVycnlwaSxib290
bG9hZGVyLWNvbmZpZyIsICJudm1lbS1ybWVtIjsKPiAtCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
PiAtCQkjc2l6ZS1jZWxscyA9IDwxPjsKPiAtCQlyZWcgPSA8MHgwIDB4MCAweDA+Owo+IC0JCW5v
LW1hcDsKPiAtCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+IC0JfTsKPiAtfTsKPiAtCj4gwqAvKiBT
REhDSSBpcyB1c2VkIHRvIGNvbnRyb2wgdGhlIFNESU8gZm9yIHdpcmVsZXNzICovCj4gwqAmc2Ro
Y2kgewo+IMKgCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+IEBAIC0yNzMsMjEgKzIzMiw2IEBACj4g
wqAJfTsKPiDCoH07Cj4gwqAKPiAKPiAtJnBjaWUwIHsKPiAtCXBjaUAxLDAgewo+IC0JCSNhZGRy
ZXNzLWNlbGxzID0gPDM+Owo+IC0JCSNzaXplLWNlbGxzID0gPDI+Owo+IC0JCXJhbmdlczsKPiAt
Cj4gLQkJcmVnID0gPDAgMCAwIDAgMD47Cj4gLQo+IC0JCXVzYkAxLDAgewo+IC0JCQlyZWcgPSA8
MHgxMDAwMCAwIDAgMCAwPjsKPiAtCQkJcmVzZXRzID0gPCZyZXNldCBSQVNQQkVSUllQSV9GSVJN
V0FSRV9SRVNFVF9JRF9VU0I+Owo+IC0JCX07Cj4gLQl9Owo+IC19Owo+IC0KClRoaXMgaXMgbm90
IHJlbGV2YW50IHRvIENNNCwgbWF5YmUgd2Ugc2hvdWxkIGxlYXZlIGl0IGluIHRoZSAuZHRzCgo+
IMKgLyogdWFydDAgY29tbXVuaWNhdGVzIHdpdGggdGhlIEJUIG1vZHVsZSAqLwo+IMKgJnVhcnQw
IHsKCldoYXQgYWJvdXQgJ3VhcnQxJz8gSSBiZWxpdmUgdGhlIGNvbmZpZ3VyYXRpb24gaXMgdGhl
IHNhbWUgZm9yIGFsbCBib2FyZHMuIHB3bTEKYWxzbyBjb21lcyB0byBtaW5kLgoKUmVnYXJkcywK
Tmljb2xhcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
