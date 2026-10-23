Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738166;
	b=napTiTCt1c3tQdDvzAXrU8xXHxl0cg9RIYkgI+zbNAjc51elSKpANCA1m35C7e3ULTzO
	 bcEmZQuBYNbY63LB+BDZeMeJ7csqPQa3A3SUQ8jidEltTJPz3NqeqIhLsdncsF+S5jAAD
	 WmH+7WGEqO/G18R/MAU5dBMec82rfrGN8poPjgeU3EzVJoYZNK9MadXv49XuJ3HWwzQAU
	 oCMb3EG6cmz1wIpSdoBwJZ+yQQOAHaC2PrIDWG+P8v8zxOkvWEnLbfZnNwtJwafpUhI4m
	 jpwKtZ7IqSotgaaiAAUAL/sVS6ZH4qqqikzJOQZt49WE9baDXKOXCW9+lchtqF4F5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738166;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:X-Scanned-By:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Transfer-Encoding:content-type;
	bh=Te/e0WFVqv5SNjVug7VJizYyRLpsYmXm4GZX821MDrs=;
	b=xseqUQIT3FBSgqS1fsfeKxyy03tuVCIM77mzM72m/v6ncb1Xk9yAypYLayJ+S137k84w
	 /3YW9Z89oWH4brCLSaGTWlnBZYP8MIJjnOgnMxAlkbBYQGV8KVpnpmCYXfDaSYIBC1mdq
	 IlUWxs8y4JwOBrur0BQeMAHw56OG4WQoQXKpZ5XmO5B8kalMo21rJzC4eNvFE9WAPTi/H
	 RIonUGec7iPKgeBy3wodzHcFp0Zzy7T1710X5wh9TOGh0VOrWXD/S8148GQEGAIV9qbBU
	 rXH9gIxRbpEVg3loveI+HC4o86Usl+FGF8mw+n/Q96i2bDor39Efyzu+e3w7L6RDYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iCifbyIR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7A606A328
	for <soc@lists.linux.dev>; Fri, 23 Oct 2026 06:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B7A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iCifbyIR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Te/e0WFVqv5SNjVug7VJizYyRLpsYmXm4GZX821MDrs=;
	b=iCifbyIRGH5mRJnt5tCI91FrGpFLCzTrd2dh5KRobIDeSLaiDh5Tja8J2ZE5BWW5tJSzDT
	x6VeWiLODOu7D5iWmd8eR2In5uSZUU3L/0gjy6BC0Pi56Ghr2+/3fpXD3syiAC3RXcOrND
	N5pdawyss7XuKQQIeEerHKJxBw11Zbw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-Gi1PK2XUM7a0J1ACcijeaQ-1; Fri,
 23 Oct 2026 02:49:18 -0400
X-MC-Unique: Gi1PK2XUM7a0J1ACcijeaQ-1
X-Mimecast-MFC-AGG-ID: Gi1PK2XUM7a0J1ACcijeaQ_1792738156
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 357A31800663;
	Fri, 23 Oct 2026 06:49:15 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 212681956095;
	Fri, 23 Oct 2026 06:49:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 00/13] treewide: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri, 23 Oct 2026 08:48:37 +0200
Message-ID: <20261023064908.66707-1-thuth@redhat.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: JDBJZJUq7dToBTjChCzTDsoQEaUFH6PO78UEu3UsQ5k_1792738156
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembly and C source code.
However, all the supported versions of the GCC and Clang compilers (and
also other compilers like Tiny-C or PCC) define the macro __ASSEMBLER__
automatically already when compiling assembly code, too, so some kernel
headers are using __ASSEMBLER__ instead. With regards to userspace code,
this seems also to be constant source of confusion, see for example these
links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it makes sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurrences of __ASSEMBLY__ into __ASSEMBLER__ and
finally removes the -D__ASSEMBLY__ from the Makefiles.

I split the patches per architecture / maintained subsystem to ease
the review, and I also split the uapi headers from the normal ones in
case we ever decide that uapi needs to be treated differently from the
normal headers here and the patches would need to get reverted.

v5:
- To ease the review, I split some huge patches into smaller patches
  when there was a separate entry for the files in the MAINTAINERS file 
- Dropped the patches that were already merged
- Rebased the patches to the current master branch and fixed new
  occurrences of __ASSEMBLY__

Thomas Huth (13):
  of: fdt: Replace __ASSEMBLY__ with __ASSEMBLER__ in of_fdt.h header
    file
  smccc: Replace __ASSEMBLY__ with __ASSEMBLER__
  ARM: PXA: Replace __ASSEMBLY__ with __ASSEMBLER__
  ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in ptrace uapi header
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  asm-generic: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  uapi: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  asm-generic: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi
    headers
  include: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  treewide: Stop defining __ASSEMBLY__ for assembler files

 Documentation/dev-tools/checkuapi.rst          |  2 +-
 Makefile                                       |  2 +-
 arch/alpha/boot/compressed/Makefile            |  2 +-
 arch/arm/include/asm/assembler.h               |  2 +-
 arch/arm/include/asm/barrier.h                 |  4 ++--
 arch/arm/include/asm/cache.h                   |  2 +-
 arch/arm/include/asm/cp15.h                    |  4 ++--
 arch/arm/include/asm/cputype.h                 |  4 ++--
 arch/arm/include/asm/current.h                 |  4 ++--
 arch/arm/include/asm/delay.h                   |  4 ++--
 arch/arm/include/asm/domain.h                  |  8 ++++----
 arch/arm/include/asm/fpstate.h                 |  2 +-
 arch/arm/include/asm/ftrace.h                  |  6 +++---
 arch/arm/include/asm/hardware/cache-b15-rac.h  |  2 +-
 arch/arm/include/asm/hardware/cache-l2x0.h     |  4 ++--
 arch/arm/include/asm/hardware/dec21285.h       |  2 +-
 arch/arm/include/asm/hardware/ioc.h            |  2 +-
 arch/arm/include/asm/hardware/iomd.h           |  4 ++--
 arch/arm/include/asm/hardware/memc.h           |  2 +-
 arch/arm/include/asm/hwcap.h                   |  2 +-
 arch/arm/include/asm/irq.h                     |  2 +-
 arch/arm/include/asm/kexec.h                   |  4 ++--
 arch/arm/include/asm/kgdb.h                    |  4 ++--
 arch/arm/include/asm/linkage.h                 |  4 ++--
 arch/arm/include/asm/mach/arch.h               |  2 +-
 arch/arm/include/asm/mcpm.h                    |  4 ++--
 arch/arm/include/asm/memory.h                  |  4 ++--
 arch/arm/include/asm/mpu.h                     |  4 ++--
 arch/arm/include/asm/opcodes.h                 | 12 ++++++------
 arch/arm/include/asm/page.h                    |  4 ++--
 arch/arm/include/asm/pgtable-2level.h          |  4 ++--
 arch/arm/include/asm/pgtable-3level.h          |  4 ++--
 arch/arm/include/asm/pgtable-nommu.h           |  4 ++--
 arch/arm/include/asm/pgtable.h                 |  8 ++++----
 arch/arm/include/asm/probes.h                  |  4 ++--
 arch/arm/include/asm/proc-fns.h                |  4 ++--
 arch/arm/include/asm/ptrace.h                  |  4 ++--
 arch/arm/include/asm/system_info.h             |  4 ++--
 arch/arm/include/asm/system_misc.h             |  4 ++--
 arch/arm/include/asm/thread_info.h             |  2 +-
 arch/arm/include/asm/thread_notify.h           |  2 +-
 arch/arm/include/asm/tlbflush.h                | 10 +++++-----
 arch/arm/include/asm/tls.h                     |  4 ++--
 arch/arm/include/asm/unified.h                 |  6 +++---
 arch/arm/include/asm/unwind.h                  |  4 ++--
 arch/arm/include/asm/v7m.h                     |  4 ++--
 arch/arm/include/asm/vdso.h                    |  4 ++--
 arch/arm/include/asm/vdso/cp15.h               |  4 ++--
 arch/arm/include/asm/vdso/gettimeofday.h       |  4 ++--
 arch/arm/include/asm/vdso/processor.h          |  4 ++--
 arch/arm/include/asm/vfp.h                     |  2 +-
 arch/arm/include/asm/virt.h                    |  4 ++--
 arch/arm/include/uapi/asm/ptrace.h             |  4 ++--
 .../mach-footbridge/include/mach/hardware.h    |  2 +-
 arch/arm/mach-pxa/irqs.h                       |  2 +-
 arch/arm/mach-pxa/pxa-regs.h                   |  2 +-
 arch/arm/mach-sa1100/include/mach/bitfield.h   |  2 +-
 arch/arm/mach-sa1100/include/mach/hardware.h   |  2 +-
 arch/arm/tools/gen-mach-types                  |  2 +-
 arch/arm64/kernel/vdso32/Makefile              |  1 -
 arch/hexagon/include/asm/hexagon_vm.h          |  4 ++--
 arch/hexagon/include/asm/mem-layout.h          |  6 +++---
 arch/hexagon/include/asm/page.h                |  4 ++--
 arch/hexagon/include/asm/processor.h           |  4 ++--
 arch/hexagon/include/asm/thread_info.h         | 12 ++++++------
 arch/hexagon/include/uapi/asm/registers.h      |  4 ++--
 arch/loongarch/vdso/Makefile                   |  2 +-
 arch/mips/boot/compressed/Makefile             |  2 +-
 arch/mips/vdso/Makefile                        |  2 +-
 arch/powerpc/boot/Makefile                     |  2 +-
 arch/powerpc/platforms/cell/spufs/Makefile     |  2 +-
 arch/s390/Makefile                             |  2 +-
 arch/x86/boot/Makefile                         |  2 +-
 arch/x86/boot/compressed/Makefile              |  2 +-
 arch/x86/realmode/rm/Makefile                  |  2 +-
 arch/xtensa/kernel/Makefile                    |  2 +-
 drivers/firmware/efi/libstub/Makefile          |  2 +-
 drivers/net/wan/Makefile                       |  2 +-
 include/asm-generic/barrier.h                  |  4 ++--
 include/asm-generic/bug.h                      |  4 ++--
 include/asm-generic/current.h                  |  2 +-
 include/asm-generic/error-injection.h          |  2 +-
 include/asm-generic/int-ll64.h                 |  6 +++---
 include/asm-generic/rwonce.h                   |  4 ++--
 include/asm-generic/signal.h                   |  4 ++--
 include/linux/amba/serial.h                    |  4 ++--
 include/linux/annotate.h                       | 18 +++++++++---------
 include/linux/arm-smccc.h                      | 10 +++++-----
 include/linux/cfi_types.h                      |  6 +++---
 include/linux/compiler.h                       |  4 ++--
 include/linux/compiler_types.h                 |  8 ++++----
 include/linux/edd.h                            |  4 ++--
 include/linux/err.h                            |  2 +-
 include/linux/export.h                         |  2 +-
 include/linux/init.h                           |  6 +++---
 include/linux/ioport.h                         |  4 ++--
 include/linux/linkage.h                        |  6 +++---
 include/linux/mem_encrypt.h                    |  4 ++--
 include/linux/of_fdt.h                         |  4 ++--
 include/linux/pe.h                             |  4 ++--
 include/linux/platform_data/emif_plat.h        |  4 ++--
 include/linux/ti-emif-sram.h                   |  2 +-
 include/linux/types.h                          |  4 ++--
 include/uapi/asm-generic/int-l64.h             |  4 ++--
 include/uapi/asm-generic/int-ll64.h            |  4 ++--
 include/uapi/asm-generic/signal-defs.h         |  2 +-
 include/uapi/asm-generic/signal.h              |  4 ++--
 include/uapi/linux/a.out.h                     |  4 ++--
 include/uapi/linux/const.h                     |  4 ++--
 include/uapi/linux/edd.h                       |  4 ++--
 include/uapi/linux/hdlc/ioctl.h                |  4 ++--
 include/uapi/linux/types.h                     |  4 ++--
 scripts/Makefile.build                         |  2 +-
 scripts/gfp-translate                          |  2 +-
 scripts/headers_install.sh                     |  1 -
 .../tests/cmd_graph/test_savedcmd_parser.py    |  2 +-
 tools/include/asm-generic/barrier.h            |  4 ++--
 tools/include/asm/alternative.h                |  2 +-
 tools/include/linux/cfi_types.h                |  6 +++---
 tools/include/linux/compiler.h                 |  4 ++--
 tools/include/uapi/linux/const.h               |  4 ++--
 .../testing/selftests/kvm/lib/riscv/handlers.S |  4 ----
 .../testing/selftests/vDSO/vgetrandom-chacha.S |  2 --
 123 files changed, 229 insertions(+), 237 deletions(-)

-- 
2.56.0

